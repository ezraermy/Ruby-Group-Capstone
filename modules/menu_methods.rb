module MenuMethods
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

  def list_of_books
    clear_screen
    @app.list_all_books
    books_menu
  end

  def list_of_labels
    clear_screen
    @app.list_all_labels
    gets
    books_menu
  end

  def add_book
    clear_screen
    @app.add_book
    books_menu
  end
end
