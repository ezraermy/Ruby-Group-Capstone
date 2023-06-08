require 'date'

class Item
  attr_accessor :genre, :author, :label, :publish_date
  attr_reader :id, :archived

  def initialize(publish_date, id: Random.rand(1..1000), archived: false)
    @id = id
    @genre = genre
    @author = author
    @label = label
    @publish_date = publish_date
    @archived = archived
  end

  private

  def can_be_archived?
    if (Date.today.year - @publish_date.year) == 10
      true if Date.today.month >= @publish_date.month && (Date.today.day > @publish_date.day)
    else
      Date.today.year - @publish_date.year > 10
    end
  end

  public

  def move_to_archive
    return unless can_be_archived?

    @archived = true
  end
end
