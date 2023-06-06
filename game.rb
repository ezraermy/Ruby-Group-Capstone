class Game < Item 
    def initialize(multiplayer, last_played_at)
        @multiplayer = multiplayer
        @last_played_at = last_played_at
    end

    def can_be_archived?
        if super && (Time.now - last_played_at > 2 * 365 * 24 * 60 * 60)
            true
        else
            false
        end
    end
end