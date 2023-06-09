require_relative '../classes/game'
require 'date'

describe Game do
  let(:multiplayer) { true }
  let(:last_played_at) { Date.parse('2020-11-12') }
  let(:publish_date) { Date.parse('2010-02-11') }
  let(:publish_date1) { Date.parse('2020-02-11') }
  let(:game) { Game.new(multiplayer, last_played_at, publish_date) }
  let(:game1) { Game.new(multiplayer, last_played_at, publish_date1) }

  it 'creates an instance of the Game class' do
    expect(game).to be_an_instance_of(Game)
  end

  it 'checks if the multiplayer is correct' do
    expect(game.multiplayer).to be_truthy
  end

  describe '#can_be_archived?' do
    it 'checks if the method is true' do
      expect(game.can_be_archived?).to be_truthy
    end

    it 'check if the method returns false' do
      expect(game1.can_be_archived?).to be_falsy
    end
  end
end
