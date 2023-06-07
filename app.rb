# frozen_string_literal: true
require 'json'
require_relative 'classes/item/item.rb'
require_relative 'classes/item/music_album.rb'
require_relative 'classes/genre.rb'
require_relative 'classes/game'
require_relative 'classes/item/author'

class App
  attr_reader :books, :music_albums, :games

  def initialize(games, authors)
    @books = []
    @music_albums = []
    @games = games
    @genres = []
    @authors = authors
  end

  def list_music_albums
    if @music_albums.empty?
      puts "No music albums found."
    else
      puts "List of Music Albums:"
      @music_albums.each_with_index do |album, index|
        puts "#{index + 1}. #{album.label}"
      end
    end
  end

  def list_genres
    if @genres.empty?
      puts "No genres found."
    else
      puts "List of Genres:"
      @genres.each_with_index do |genre, index|
        puts "#{index + 1}. #{genre.name}"
      end
    end
  end

  def add_music_album
    print "Enter the music album label: "
    label = gets.chomp
    print "Enter the music album publish date (YYYY-MM-DD): "
    publish_date = gets.chomp
    print "Is the music album available on Spotify? (true/false): "
    on_spotify = gets.chomp.downcase == 'true'

    music_album = MusicAlbum.new(publish_date, on_spotify)
    music_album.label = label

    print "Enter the genre of the music album: "
    genre_name = gets.chomp

    genre = find_or_create_genre(genre_name)
    genre.add_item(music_album)

    @music_albums << music_album
    puts "Music album added successfully!"
  end

  def list_games
    puts "No games available" if @games.empty?

    @games.each do |game|
      puts "Author: #{game.author&.first_name} Published in: #{game.publish_date}"
    end
  end

  def list_authors
    @authors.each do |author|
      puts "#{author.first_name} #{author.last_name}"
    end
  end

  def add_game
    puts 'Is it a multiplayer game? [Y/N]'
    user_input = gets.chomp.downcase
    multiplayer = user_input == 'y' ? true : false

    puts 'When was it last played (YYYY-MM-DD): '
    last_played_at = gets.chomp

    puts 'When was it published (YYYY-MM-DD): '
    publish_date = gets.chomp

    @games << Game.new(multiplayer, last_played_at, publish_date)
     
    puts "The game with ID #{@games.last.id} was successfully created"
  end

  def save_game_author_data
    games_json = @games.map do |game|
      {
        multiplayer: game.multiplayer,
        last_played_at: game.last_played_at,
        publish_date: game.publish_date,
        archived: game.archived,
        author: "#{game.author&.first_name} #{game.author&.last_name}",
        type: 'Game'
      }
    end

    authors_json = @authors.map do |author|
      {
        first_name: author.first_name,
        last_name: author.last_name,
        type: 'Author'
      }
    end

    File.write('data/games.json', JSON.generate(games_json))
    File.write('data/authors.json', JSON.generate(authors_json))
  end

  private

  def find_or_create_genre(genre_name)
    genre = @genres.find { |g| g.name == genre_name }

    if genre.nil?
      genre = Genre.new(genre_name)
      @genres << genre
    end

    genre
  end
end
