require_relative 'classes/item/item'
require 'date'

class Game < Item 
    attr_accessor :multiplayer, :last_played_at

    def initialize(multiplayer, last_played_at, publish_date)
        super(publish_date)       
        @multiplayer = multiplayer
        @last_played_at = last_played_at
    end

    def can_be_archived?
        super && ((Date.today - @last_played_at) > 2 * 365)
    end
end