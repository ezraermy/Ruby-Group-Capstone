require_relative 'menu'
require_relative 'app'
require_relative 'modules/album_data'
require_relative 'loader'

def main
  loader = Loader.new
  app = App.new(loader.games, loader.authors)
  menu = Menu.new(app)

  # app.load_data
  app.load_data

  loop do
    break if menu.display_menu_options == 4
  end

  # app.save_data
  app.save_data

  puts 'Exiting the app, goodbye!'
  gets
  menu.clear_screen
end

main
