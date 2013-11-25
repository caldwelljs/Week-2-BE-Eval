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
    
    def game_score
    end
  end

  

  # class Player
  #   attr_accessor :points, :opponent, :name

  #   def initialize(name)
  #     @points = 0
  #     @name = name
  #   end

  #   # Increments the score by 1.
  #   #
  #   # Returns the integer new score.
  #   def record_won_ball!
  #     @points += 1
  #     return @points
  #   end

  #   # Returns the String score for the player.
  #   # Tracks and returns player scores
  #   def score
  #     while points < 3
  #       return 'love' if points == 0
  #       return 'fifteen' if points == 1
  #       return 'thirty' if points == 2
  #       end
  #     end

  #     while points >= 3
  #       if points == 3 && opponent.points < 3
  #         return 'forty'
  #       elsif points == opponent.points
  #         return 'deuce'
  #       elsif points - opponent.points == 1
  #         return "Advantage #{player.name}"
  #       elsif points - opponent.points == -1
  #         return "Advantage #{opponent.name}"
  #       elsif points - opponent.points == 2
  #         return "Game: #{self.name}"
  #       elsif points - opponent.points == -2
  #         return "Game: #{self.opponent.name}"
  #       end

  #     end

  #   end
  # end


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

    # Returns the String score for the player.
    
    def set_advantage
      if points > opponent.points
        return 'Advantage Player 1'
      else
        return 'Advantage Player 2'
      end
    end

    def game_winner
      if points > opponent.points
        return 'Player 1 Wins'
      else
        return 'Player 2 Wins'
      end
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