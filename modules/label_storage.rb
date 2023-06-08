module LabelStorage
  def save_labels
    File.write('./data/labels.json', @labels.to_json)
  end

  def load_labels
    return unless File.exist?('./data/labels.json')

    JSON.parse(File.read('./data/labels.json')).each do |label|
      new_label = Label.new(label['title'], label['color'], id: label['id'])
      @labels << new_label
    end
  end
end
