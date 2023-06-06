require 'date'

class Item
    attr_accessor :genre, :author, :label, :publish_date, :archived
    attr_reader :id
    def initialize(publish_date)
        @id = Random.rand(1..1000)
        @genre = genre
        @author = author
        @label = label
        @publish_date = publish_date
        @archived = false
    end

    def can_be_archived?
        if Date.today.year - @publish_date.year == 10
            if Date.today.month >= @publish_date.month
                if Date.today.day > @publish_date.day
                    true
                end
            end
        else
            Date.today.year - @publish_date.year > 10
        end
    end

    def move_to_archive
        if can_be_archived?
            @archived = true
        end
    end
end