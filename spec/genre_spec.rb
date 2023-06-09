require_relative '../classes/genre'
require 'rspec'

RSpec.describe Genre do
  let(:item) { double('Item') }
  let(:genre) { Genre.new('Rock') }

  describe '#add_item' do
    it 'adds the item to the collection of items' do
      allow(item).to receive(:genre=).with(genre)
      genre.add_item(item)
      expect(genre.items).to include(item)
    end
  end
end
