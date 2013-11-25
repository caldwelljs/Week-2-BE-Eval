require 'rubygems'
require 'bundler/setup'
require 'rspec'
require_relative '../tennis'

describe Tennis::Game do
  let(:game) { Tennis::Game.new }

  describe '.initialize' do
    it 'creates two players' do
      expect(game.player1).to be_a(Tennis::Player)
      expect(game.player2).to be_a(Tennis::Player)
    end

    it 'sets the opponent for each player' do
      expect(game.player1.opponent).to eq(game.player2)
      expect(game.player2.opponent).to eq(game.player1)
    end
  end

  describe '#wins_ball' do
    it 'increments the points of the winning player' do
      game.wins_ball(1)

      expect(game.player1.points).to eq(1)
    end
  end
end

describe Tennis::Player do
  let(:player) do
    player = Tennis::Player.new("Pete")
    player.opponent = Tennis::Player.new("Andre")

    return player
  end

  describe '.initialize' do
    it 'sets the points to 0' do
      expect(player.points).to eq(0)
    end 
  end

  describe '#record_won_ball!' do
    it 'increments the points' do
      player.record_won_ball!

      expect(player.points).to eq(1)
    end
  end

  describe '#score' do
    context 'when points is 0' do
      it 'returns love' do
        expect(player.score).to eq('love')
      end
    end

    context 'when points is 1' do
      it 'returns fifteen' do
        player.points = 1

        expect(player.score).to eq('fifteen')
      end 
    end

    context 'when points is 2' do
      it 'returns thirty' do
        player.points = 2

        expect(player.score).to eq('thirty')
      end
    end
    
    context 'when both players have 3 points' do
      it 'returns deuce' do
        player.points = 3
        player.opponent.points = 3

        expect(player.score).to eq('deuce')
      end
    end

    context 'when player 1 has 4 points and player 2 has 3' do
      it 'returns Advantage: Pete' do
        player.points = 4
        player.opponent.points = 3

        expect(player.score).to eq('Advantage: Pete')
      end
    end
    
    context 'when player 2 has 4 points and player 1 has 3' do
      it 'returns Advantage: Andre' do
        player.points = 3
        player.opponent.points = 4

        expect(player.score).to eq('Advantage: Andre')
      end
    end

    context 'when player 1 has 5 points and player 2 has 3' do
      it 'returns Player 1 Wins' do
        player.points = 5
        player.opponent.points = 3

        expect(player.score).to eq('Game: Pete')
      end
    end

    context 'when player 2 has 5 points and player 1 has 3' do
      it 'returns Player 2 Wins' do
        player.points = 3
        player.opponent.points = 5

        expect(player.score).to eq('Game: Andre')
      end
    end

    context 'when player 1 has 7 points and player 2 has 6' do
      it 'returns Advantage Player 1' do
        player.points = 7
        player.opponent.points = 6

        expect(player.score).to eq('Advantage: Pete')
      end
    end

    context 'when player 2 has 7 points and player 1 has 6' do
      it 'returns Advantage Player 2' do
        player.points = 6
        player.opponent.points = 7

        expect(player.score).to eq('Advantage: Andre')
      end
    end

    context 'when player 2 has 7 points and player 1 has 7' do
      it 'returns deuce' do
        player.points = 7
        player.opponent.points = 7

        expect(player.score).to eq('deuce')
      end
    end
  end
end