require 'securerandom'

class Genre
  attr_accessor :name, :items
  attr_reader :id

  def initialize(name)
    @id = SecureRandom.uuid
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
  end
end
