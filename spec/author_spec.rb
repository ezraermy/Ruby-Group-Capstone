require './author'

describe Author

let(:id) { 4 }
let(:first_name) { 'Kennedy' }
let(:last_name) { 'Wattson' }
let(:items) { [] }
let(:author) { Author.new(first_name, last_name)}

it 'checks if the author is an istance of the class' do
    expect(author).to be_an_instance_of(Author)
end

it 'checks if the id is right' do
    expect(author.id).to eql(4)
end

describe '#add_item' do
it 'adds the new item to the items array' do
    author.add_item('Item 1')
    expect(items.length).to eql(1)
end
end
end