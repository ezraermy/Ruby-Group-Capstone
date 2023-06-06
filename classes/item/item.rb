# frozen_string_literal: true

require 'date'

class Item
  attr_accessor :genre, :author, :label, :publish_date
  attr_reader :id, :archived

  def initialize(publish_date)
    @id = rand(0..10_000)
    @genre = genre
    @author = author
    @label = label
    @publish_date = publish_date
    @archived = false
  end

  def can_be_archived?
    if (Date.today.year - @publish_date.year) == 10
      true if Date.today.month >= @publish_date.month && (Date.today.day > @publish_date.day)
    else
      Date.today.year - @publish_date.year > 10
    end
  end

  def move_to_archive
    return unless can_be_archived?

    @archived = true
  end
end
