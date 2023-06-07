# frozen_string_literal: true

require_relative '../classes/item/book'

book1 = Book.new('publisher', 'good', Date.new(2013, 10, 1))
book2 = Book.new('publisher', 'bad', Date.new(2020, 1, 1))
book3 = Book.new('publisher', 'good', Date.new(2010, 1, 1))
describe Book do
  it 'has a publisher' do
    expect(book1.publisher).to eq('publisher')
  end

  it 'has a condition' do
    expect(book1.cover_state).to eq('good')
  end

  it 'can change the condition' do
    book3.cover_state = 'bad'
    expect(book3.cover_state).to eq('bad')
  end

  it 'move_to_archive changed archived state to true if more than 10 years old' do
    book3.move_to_archive
    expect(book3.archived).to eq(true)
  end

  it 'move_to_archive changed archived state to true if condition is bad' do
    book2.move_to_archive
    expect(book2.archived).to eq(true)
  end

  it 'move_to_archive does not change archived state if less than 10 years old' do
    book1.move_to_archive
    expect(book1.archived).to eq(false)
  end
end
