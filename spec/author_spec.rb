require_relative '../classes/item/author.rb'
require_relative '../classes/item/item.rb'

describe Author do
  let(:first_name) { 'Kennedy' }
  let(:last_name) { 'Wattson' }
  let(:author) { Author.new(first_name, last_name) }
  let(:item) { Item.new('2022-02-12')}

  it 'checks if the author is an instance of the class' do
    expect(author).to be_an_instance_of(Author)
  end

  it 'checks if the first_name is correct' do
    expect(author.first_name).to eql('Kennedy')
  end

  describe '#add_item' do
    it 'adds the new item to the items array' do
      author.add_item(item)
      expect(author.items.length).to eql(1)
    end
  end
end
