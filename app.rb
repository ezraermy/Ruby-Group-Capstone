# frozen_string_literal: true

class App
  attr_reader :books, :albums, :games

  def initialize
    @books = []
    @albums = []
    @games = []
  end

  def clear_screen
    system('cls')
    system('clear')
  end

  def books_list
    clear_screen
  end

  def list_games
    @games.each do |game|
      puts "No games available" if @games.empty?

      puts "Genre: #{game.genre.name}, Author: #{game.author.first_name}"
    end
  end

  def list_authors
    @authors.each do |game|
      puts "#{author.first_name} #{author.last_name}"
    end
  end

  def add_game
    puts 'Is it a multiplayer game? [Y/N]'
    user_input = gets.chomp.downcase
    multiplayer = user_input == 'y' ? true : false

    puts 'When was it last played'
    last_played_at = gets.chomp

    puts 'When was it published'
    publish_date = gets.chomp

    @games << Game.new(multiplayer, last_played_at, publish_date)
  end

end
