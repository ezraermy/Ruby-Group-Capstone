# frozen_string_literal: true

require 'date'

class Item
  attr_accessor :genre, :author, :label, :publish_date
  attr_reader :id, :archived

  def initialize(publish_date)
    @id = Random.rand(1..1000)
    @genre = genre
    @author = author
    @label = label
    @publish_date = publish_date
    @archived = false
  end

  def can_be_archived?
    difference_in_years = Date.today.year - publish_date.year
    difference_in_years >= 10 && Date.today >= publish_date + 10.years
  end

  def move_to_archive
    return unless can_be_archived?
    @archived = true
  end
end
