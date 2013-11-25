module Tennis
  class Game
    attr_accessor :player1, :player2, :score

    def initialize
      @player1 = Player.new("Player1 Pete")
      @player2 = Player.new("Player2 Andre")

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
    
    def game_score
      if @player1.points == @player2.points && @player1.points < 3
        return "#{@player1.score} all!"
      end
    end
  end

  class Player
  attr_accessor :points, :opponent, :name

    def initialize(name)
      @points = 0
      @name = name
    end

    # Increments the score by 1.
    #
    # Returns the integer new score.
    def record_won_ball!
      @points += 1
      return @points
    end

    def score
      while points < 3
        if points == 0
          return 'love'
        elsif points == 1
          return 'fifteen'
        elsif points == 2
          return 'thirty'
        end
      end

      while points >= 3
        if points == opponent.points
          return 'deuce'
        elsif points - opponent.points == 1
          return "Advantage: #{self.name}"
        elsif points - opponent.points == -1
          return "Advantage: #{self.opponent.name}"
        elsif points - opponent.points == 2
          return "Game: #{self.name}"
        elsif points - opponent.points == -2
          return "Game: #{self.opponent.name}"
        end
      end

    end
  end
end