require './game.rb'

describe Game
let(:multiplayer) { true }
let(:last_played_at) { '2020/11/12'}
let(:game) {Game.new(multiplayer, last_played_at)}

it 'creates an instance of the Game class' do
    expect(game).to be_an_instance_of(Game), 'Incorrect instance of the class'
end

it 'checks if the multiplayer is correct' do
    expect(game.multiplayer).to be_truthy
end

describe '#can_be_archived?' do
it 'checks if the method is true' do
    expect(game.can_be_archived).to be_truthy
end
end
end