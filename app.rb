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
end
