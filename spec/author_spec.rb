require_relative '../author'

describe Author do
  let(:id) { 4 }
  let(:first_name) { 'Kennedy' }
  let(:last_name) { 'Wattson' }
  let(:items) { [] }
  let(:author) { Author.new(id, first_name, last_name) }

  it 'checks if the author is an instance of the class' do
    expect(author).to be_an_instance_of(Author)
  end

  it 'checks if the id is correct' do
    expect(author.id).to eql(4)
  end

  describe '#add_item' do
    it 'adds the new item to the items array' do
      author.add_item('Item 1')
      expect(author.items.length).to eql(1)
    end
  end
end
