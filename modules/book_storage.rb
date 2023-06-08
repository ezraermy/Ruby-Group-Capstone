module BookStorage
  def save_books
    File.write('./data/books.json', @books.to_json)
  end

  def load_books
    return unless File.exist?('./data/books.json') && File.size('./data/books.json') > 0

    JSON.parse(File.read('./data/books.json')).each do |book|
      new_book = Book.new(book['publisher'], book['cover_state'], book['publish_date'], id: book['id'],
                                                                                        archived: book['archived'])
      new_book.label= @labels.find { |label| label.id == book['label']['id'] }
      @books << new_book
    end
  end
end
