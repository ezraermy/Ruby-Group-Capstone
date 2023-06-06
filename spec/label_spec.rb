# frozen_string_literal: true

require_relative '../classes/label'

describe Label do
  label = Label.new('label_name')
  it 'has a name' do
    expect(label.name).to eq('label_name')
  end
  it 'can change the name' do
    label.name = 'new_label_name'
    expect(label.name).to eq('new_label_name')
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
