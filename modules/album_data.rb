require 'json'
require 'fileutils'

module AlbumData
  DATA_DIR = 'data'.freeze
  ALBUMS_FILE = "#{DATA_DIR}/albums.json".freeze
  GENRES_FILE = "#{DATA_DIR}/genres.json".freeze

  def save_data
    create_data_directory
    save_albums
    save_genres
  end

  def load_data
    load_albums
    load_genres
  end

  private

  def create_data_directory
    FileUtils.mkdir_p(DATA_DIR)
  end

  def save_albums
    album_data = @music_albums.map do |album|
      {
        'label' => album.label,
        'publish_date' => album.publish_date,
        'on_spotify' => album.on_spotify
      }
    end

    File.write(ALBUMS_FILE, JSON.generate(album_data))
  end

  def load_albums
    return unless File.exist?(ALBUMS_FILE)

    album_data = JSON.parse(File.read(ALBUMS_FILE))

    album_data.each do |album|
      music_album = MusicAlbum.new(album['publish_date'], album['on_spotify'])
      music_album.label = album['label']
      @music_albums << music_album
    end
  end

  def save_genres
    genre_data = @genres.map do |genre|
      {
        'name' => genre.name,
        'items' => genre.items.map(&:label)
      }
    end

    File.write(GENRES_FILE, JSON.generate(genre_data))
  end

  def load_genres
    return unless File.exist?(GENRES_FILE)

    genre_data = JSON.parse(File.read(GENRES_FILE))

    genre_data.each do |genre|
      new_genre = Genre.new(genre['name'])
      genre['items'].each do |item_label|
        item = @music_albums.find { |album| album.label == item_label }
        new_genre.add_item(item)
      end
      @genres << new_genre
    end
  end
end
