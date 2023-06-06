require 'date'
require_relative '../classes/item/music_album.rb'

describe MusicAlbum do
  let(:album) { MusicAlbum.new('2010-01-01', true) }

  it 'is an instance of MusicAlbum' do
    expect(album).to be_an_instance_of MusicAlbum
  end

  it 'has a publish date' do
    expect(album.publish_date).to eq '2010-01-01'
  end

  it 'has a Spotify value' do
    expect(album.on_spotify).to eq true
  end
end
