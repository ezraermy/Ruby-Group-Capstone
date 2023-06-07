require 'json'

class Loader
    def initialize
        load_data
    end

    def load_data
        @games = load_games
        @authors = load_authors
    end

    def load_games
        return [] unless File.exist?('data/games.json')

        games_json = File.read('data/games.json')
        return [] if games_json.empty?

        games_data = JSON.parse(games_json)
        games_data.map {|game|  Game.new(game['multiplayer'], game['last_played_at'], game['publish_date'])}
    end

    def load_authors
        return [] unless File.exist?('data/authors.json')

        authors_json = File.read('data/authors.json')
        return [] if authors_json.empty?

        authors_data = JSON.parse(authors_json)
        authors_data.map {|author| Author.new(author['first_name'], author['last_name'])}
    end
end