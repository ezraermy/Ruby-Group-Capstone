require_relative 'classes/item/item'
require_relative 'classes/item/music_album'
require_relative 'classes/genre'
require_relative 'classes/label'
require_relative 'classes/item/book'
require_relative 'modules/book_module'
require_relative 'modules/label_module'
require 'date'

class App
  include BookModule
  include LabelModule

  attr_reader :books, :music_albums, :games

  def initialize
    @books = []
    @music_albums = []
    @games = []
    @genres = []
    @labels = []
  end

  def list_music_albums
    if @music_albums.empty?
      puts 'No music albums found.'
    else
      puts 'List of Music Albums:'
      @music_albums.each_with_index do |album, index|
        puts "#{index + 1}. #{album.label}"
      end
    end
  end

  def list_genres
    if @genres.empty?
      puts 'No genres found.'
    else
      puts 'List of Genres:'
      @genres.each_with_index do |genre, index|
        puts "#{index + 1}. #{genre.name}"
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
