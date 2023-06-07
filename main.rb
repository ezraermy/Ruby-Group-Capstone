# frozen_string_literal: true

require_relative 'modules/menu'
require_relative 'app'

def main
  app = App.new
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
