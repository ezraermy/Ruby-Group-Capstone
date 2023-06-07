require_relative '../classes/label'

class Item
  attr_accessor :genre, :author, :label, :publish_date
  attr_reader :id, :archived

  def initialize(publish_date)
    @id = rand(0..10_000)
    @genre = genre
    @author = author
    @label = label
    @publish_date = publish_date
    @archived = false
  end
end

describe Label do
  label = Label.new('label_title', 'label_color')
  it 'has a title' do
    expect(label.title).to eq('label_title')
  end
  it 'can change the title' do
    label.title = 'new_label_title'
    expect(label.title).to eq('new_label_title')
  end

  it 'has a color' do
    expect(label.color).to eq('label_color')
  end

  it 'can change the color' do
    label.color = 'new_label_color'
    expect(label.color).to eq('new_label_color')
  end

  it 'has an empty array of items' do
    expect(label.items).to eq([])
  end

  it 'has 1 objects in the item array with label variable = label' do
    item = Item.new(Date.new(2010, 1, 1))
    label.add_item(item)
    expect(label.items[0].label).to eq(label)
  end
end
