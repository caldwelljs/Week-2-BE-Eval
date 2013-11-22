module Tennis
  class Game
    attr_accessor :player1, :player2

    def initialize
      @player1 = Player.new
      @player2 = Player.new

      @player1.opponent = @player2
      @player2.opponent = @player1
    end

    # Records a win for a ball in a game.
    #
    # winner - The Integer (1 or 2) representing the winning player.
    #
    # Returns the score of the winning player. 
    def wins_ball(winner)
      # TODO: Think it's gross to pass an integer instead of a player object?
      # Then reimplement this method!

      if winner == 1
        winning_player = @player1
      elsif winner == 2
        winning_player = @player2
      end
      winning_player.record_won_ball!
    end
  end



  class Player
    attr_accessor :points, :opponent

    def initialize
      @points = 0
    end

    # Increments the score by 1.
    #
    # Returns the integer new score.
    def record_won_ball!
      @points += 1
    end

    # Returns the String score for the player.
    
    def set_advantage
      if player1.score > player2.score
        return 'Advantage Player 1'
      else
        return 'Advantage Player 2'
    end

    def game_winner
      if player1.score > player2.score
        return 'Player 1 Wins'
      else
        return 'Player 2 Wins!'
      end

    def score
      while points < 3
        if points == 0
          return 'love' if @points == 0
        elsif points == 1
          return 'fifteen'
        elsif points == 2
          return 'thirty'
        end
      end

      if player.score > 2 && player.score == player.opponent.score
        return 'deuce'
      elsif player.score > 2 && (player.score - player.opponent.score = 1)
        if player1.score 
        return set_advantage
      elsif player.score > 2 && (player.score - player.opponent.score = -1)
        return set_advantage
      elsif player.score < player.score && (player.score - player.opponent.score = 2)
        return game_winner
      elsif player.score < player.score && (player.score - player.opponent.score = -2)
        return game_winner
      end
    end
  end
end