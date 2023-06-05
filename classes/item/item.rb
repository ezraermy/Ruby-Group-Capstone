class Item
    attr_setter :genre, :author, :label, :publish_date, :archived
    attr_reader :id
    def initialize(publish_date)
        @id = Math.rand(1000)
        @genre = genre
        @author = author
        @label = label
        @publish_date = publish_date
        @archived = false
    end

    def can_be_archived?
        Date.today.year - @publish_date.year > 10
    end

    def move_to_archive
        if can_be_archived?
            @archived = true
        end
    end