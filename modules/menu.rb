# frozen_string_literal: true
class Menu
  def initialize(app)
    @app = app
  end

  MAIN_OPTIONS = {
    1 => :books_menu,
    2 => :music_menu,
    3 => :games_menu,
    4 => :exit_app
  }.freeze
  BOOKS_OPTIONS = {
    1 => :list_of_books,
    2 => :add_book,
    3 => :main_menu
  }.freeze
  MUSIC_OPTIONS = {
    1 => :list_of_music_albums,
    2 => :list_of_genres,
    3 => :add_music_album,
    4 => :main_menu
  }.freeze
  GAMES_OPTIONS = {
    1 => :list_of_games,
    2 => :add_game,
    3 => :main_menu
  }.freeze

#---------------------------
  def list_of_music_albums
    @app.list_music_albums
    gets
    music_menu
  end

  def list_of_genres
    @app.list_genres
    gets
    music_menu
  end

  def add_music_album
    @app.add_music_album
    gets
    music_menu
  end
#---------------------------

#-------------------------------------------------------
# Games SECTION
def list_of_games
  @app.list_games
  gets
  games_menu
end

def list_of_authors
  @app.list_authors
  gets
  games_menu
end

def add_game
  @app.add_game
  gets
  games_menu
end
#-----------------------------------------------------------------------

  def display_menu_options
    clear_screen
    puts 'Please selelct an option:'
    MAIN_OPTIONS.each do |key, value|
      puts "#{key}: #{menu_option_name(value)}"
    end
    choice = gets.chomp.to_i
    handle_choice(MAIN_OPTIONS, choice)
  end

  def handle_choice(options, choice)
    if options.key?(choice)
      send(options[choice])
      choice
    else
      clear_screen
      puts 'Invalid choice, please try again.'
      gets
      if options == MAIN_OPTIONS
        100
      elsif options == BOOKS_OPTIONS
       books_menu
      elsif options == MUSIC_OPTIONS
        music_menu
      elsif options == GAMES_OPTIONS
        games_menu
      end
    end
  end

  def clear_screen
    system('cls')
    system('clear')
  end

  def exit_app
    clear_screen
    0
  end

  private

  def main_menu
    0
  end

  def menu_option_name(method_name)
    method_name.to_s.split('_').map(&:capitalize).join(' ')
  end

  def books_menu
    clear_screen
    puts 'Books Menu'
    puts 'Please select an option:'
    puts '1: List all books'
    puts '2: Add a book'
    puts '3: Main Menu'
    handle_choice(BOOKS_OPTIONS, gets.chomp.to_i)
  end

  def music_menu
    clear_screen
    puts 'Music Menu'
    puts 'Please select an option:'
    puts '1: List all albums'
    puts '2: List all genres'
    puts '3: Add an album'
    puts '4: Main Menu'
    handle_choice(MUSIC_OPTIONS, gets.chomp.to_i)
  end

  def games_menu
    clear_screen
    puts 'Games Menu'
    puts 'Please select an option:'
    puts '1: List all games'
    puts '2: Add a game'
    puts '3: Main Menu'
    handle_choice(GAMES_OPTIONS, gets.chomp.to_i)
  end

  def books_list
    clear_screen
  end

  def music_list
    clear_screen
  end

  def games_list
    clear_screen
  end
end