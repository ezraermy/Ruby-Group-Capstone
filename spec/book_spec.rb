# frozen_string_literal: true

require_relative '../classes/book'

book1 = Book.new('publisher', 'good', '2013-10-01')
book2 = Book.new('publisher', 'bad', '2020-01-01')
book3 = Book.new('publisher', 'good', '2010-01-01')
describe Book do
  it 'has a publisher' do
    expect(book1.publisher).to eq('publisher')
  end

  it 'has a condition' do
    expect(book1.condition).to eq('good')
  end

  it 'can change the condition' do
    book1.condition = 'bad'
    expect(book1.condition).to eq('bad')
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
