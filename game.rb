class Game < Item 
    attr_accessor :multiplayer, :last_played_at

    def initialize(multiplayer, last_played_at)
        @multiplayer = multiplayer
        @last_played_at = last_played_at
    end

    def can_be_archived?
        super && (Time.now - @last_played_at > 2 * 365 * 24 * 60 * 60)
    end
end