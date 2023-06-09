require 'json'
require_relative 'classes/item/item'
require_relative 'classes/item/music_album'
require_relative 'classes/genre'
require_relative 'classes/label'
require_relative 'classes/item/book'
require_relative 'modules/book_module'
require_relative 'modules/label_module'
require_relative 'modules/album_data'
require_relative 'modules/label_storage'
require_relative 'modules/book_storage'
require 'date'

class App
  include AlbumData
  include BookModule
  include LabelModule
  include LabelStorage
  include BookStorage

  attr_reader :books, :music_albums, :games

  def initialize(games, authors)
    @books = []
    @music_albums = []
    @games = games
    @genres = []
    @authors = authors
    @labels = []
  end

  def list_music_albums
    if @music_albums.empty?
      puts 'No music albums found.'
    else
      puts 'List of Music Albums:'
      @music_albums.each_with_index do |album, index|
        puts "#{index + 1}. Label: #{album.label}, Published_date: (#{album.publish_date})"
      end
    end
  end

  def list_genres
    if @genres.empty?
      puts 'No genres found.'
    else
      puts 'List of Genres:'
      @genres.each_with_index do |genre, index|
        puts "#{index + 1}. Genre: #{genre.name}"
      end
    end
  end

  def add_music_album
    print 'Enter the music album label: '
    label = gets.chomp
    print 'Enter the music album publish date (YYYY-MM-DD): '
    publish_date = gets.chomp
    print 'Is the music album available on Spotify? (true/false): '
    on_spotify = gets.chomp.downcase == 'true'

    music_album = MusicAlbum.new(publish_date, on_spotify)
    music_album.label = label

    print 'Enter the genre of the music album: '
    genre_name = gets.chomp

    genre = find_or_create_genre(genre_name)
    genre.add_item(music_album)

    @music_albums << music_album
    puts 'Music album added successfully!'
  end

  def list_games
    puts 'No games available' if @games.empty?

    puts 'Our Games: '
    @games.each do |game|
      puts "Multiplayer: #{game.multiplayer}; Published in: #{game.publish_date}"
    end
  end

  def list_authors
    puts 'No authors' if @authors.empty?

    puts 'Right now these Authors are availabe: '
    @authors.each_with_index do |author, index|
      puts "#{index + 1}. #{author.first_name} #{author.last_name}"
    end
  end

  def add_game
    puts 'Is it a multiplayer game? [Y/N]'
    user_input = gets.chomp.downcase
    multiplayer = user_input == 'y'

    puts 'When was it last played (YYYY-MM-DD): '
    last_played_at = gets.chomp

    puts 'When was it published (YYYY-MM-DD): '
    publish_date = gets.chomp

    game = Game.new(multiplayer, last_played_at, publish_date)

    puts 'Who is the creator of this game: '
    puts 'First Name: '
    first_name = gets.chomp
    puts 'Last Name: '
    last_name = gets.chomp

    author = Author.new(first_name, last_name)
    author.add_item(game)

    @authors << author
    @games << game

    puts "The game with ID #{@games.last.id} was successfully created"
  end

  def save_game_author_data
    games_json = @games.map do |game|
      {
        id: game.id,
        multiplayer: game.multiplayer,
        last_played_at: game.last_played_at,
        publish_date: game.publish_date,
        archived: game.archived,
        author: "#{game.author&.first_name} #{game.author&.last_name}"
      }
    end

    authors_json = @authors.map do |author|
      {
        first_name: author.first_name,
        last_name: author.last_name
      }
    end

    File.write('data/games.json', JSON.generate(games_json))
    File.write('data/authors.json', JSON.generate(authors_json))
    puts 'Music album added successfully!'
  end

  def save
    save_labels
    save_books
  end

  def load
    load_labels
    load_books
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
