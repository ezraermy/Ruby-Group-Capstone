# frozen_string_literal: true

require_relative 'modules/menu'
require_relative 'app'
require_relative 'loader'

def main
  loader = Loader.new
  app = App.new(loader.games, loader.authors)
  menu = Menu.new(app)

  # app.load_data

  loop do
    break if menu.display_menu_options == 4
  end

  # app.save_data
  puts 'Exiting the app, goodbye!'
  gets
  menu.clear_screen
end

main
