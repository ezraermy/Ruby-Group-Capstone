# frozen_string_literal: true

require_relative '../classes/label'

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

  it 'has 3 objects in the item array' do
    label.add_item('item1')
    label.add_item('item2')
    label.add_item('item3')
    expect(label.items).to eq(%w[item1 item2 item3])
  end
end
