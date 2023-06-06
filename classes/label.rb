# frozen_string_literal: true

class Label
  attr_accessor :title, :color
  attr_reader :id, :items

  def initialize(title, color)
    @id = rand(10_000)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item
  end
end
