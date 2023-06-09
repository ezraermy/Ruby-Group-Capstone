require 'date'
require_relative '../classes/item/music_album'

describe MusicAlbum do
  let(:publish_date) { Date.parse('2023-01-01') }
  let(:publish_date2) { Date.parse('2010-01-01') }
  let(:album) { MusicAlbum.new(publish_date, true) }
  let(:album2) { MusicAlbum.new(publish_date2, true) }
  let(:album3) { MusicAlbum.new(publish_date2, false) }

  it 'is an instance of MusicAlbum' do
    expect(album).to be_an_instance_of MusicAlbum
  end

  it 'has a publish date' do
    expect(album.publish_date).to eq publish_date
  end

  it 'has a Spotify value' do
    expect(album.on_spotify).to eq true
  end

  it 'can be archived' do
    expect(album.can_be_archived?).to eq false
    expect(album2.can_be_archived?).to eq true
    expect(album3.can_be_archived?).to eq false
  end
end
