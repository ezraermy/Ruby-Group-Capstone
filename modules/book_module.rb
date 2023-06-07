module BookModule
  def new_book_creator(book)
    label = label_getter
    label.add_item(book)
    @books << book
  rescue NoMethodError
    puts 'Invalid label, please try again'
    new_book_creator(book)
  end

  def cover_state_getter
    print 'cover state:'
    op = gets.chomp.to_i
    case op
    when 1
      'Good'
    when 2
      'Bad'
    else
      puts 'Select a valid option'
      cover_state_getter
    end
  end

  def add_book
    puts "Creating new book\n"
    print 'Publisher: '
    publisher = gets.chomp
    puts 'select cover state:'
    puts '[1] Good'
    puts '[2] Bad'
    cover_state = cover_state_getter
    puts '-Published date-'
    publish_date = date_getter
    book = Book.new(publisher, cover_state, publish_date)
    new_book_creator(book)
    puts 'Book created successfully'
    gets
  end

  def date_getter
    begin
      print 'Date (YYYY-MM-DD): '
      date = Date.parse(gets.chomp)
    rescue ArgumentError
      puts 'Invalid date, please try again'
      date_getter
    end
    date
  end

  def list_all_books
    if @books.length >= 1
      @books.each_with_index do |book, i|
        puts "#{i + 1} - Title: #{book.label.title}" \
             ", Publisher: #{book.publisher}, Publish date: #{book.publish_date}"\
             ", Cover state: #{book.cover_state}"
        # ", Author: #{book.author.first_name} #{book.author.last_name}, " \
        # ", Genre: #{book.genre}, " \
      end
    else
      puts "There's no book registered"
    end
    puts 'Press enter to continue'
    gets
  end
end
