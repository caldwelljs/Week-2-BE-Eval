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

      if player.opponent.score == 3 && player.score == 3
        return 'deuce'
      else
        return "forty"
      end
    end
  end
end