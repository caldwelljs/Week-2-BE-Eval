module Tennis
  # Public: A Class containing the elements of a game of tennis.
  class Game
    attr_accessor :player1, :player2, :score

    # Public: Initializes a game of tennis with two players set as opponents. 
    # 
    # Called automatically when a new Game Object is created.
    def initialize
      @player1 = Player.new("Player1 Pete")
      @player2 = Player.new("Player2 Andre")

      @player1.opponent = @player2
      @player2.opponent = @player1
    end

    # PublicRecords a win for a ball in a game.
    #
    # winner - The Integer (1 or 2) representing the winning player.
    #
    # Returns the score of the winning player. 
    def wins_ball(winner)
      if winner == 1
        winning_player = @player1
      elsif winner == 2
        winning_player = @player2
      end
      
      winning_player.record_won_ball!
    end

    # Public: Returns the score of the game in tennis style naming
    #
    #     Example
    #     # => When player 2 has 7 points and player 1 has 7:
    #     # =>    returns => "deuce"
    #
    # Returns game scores as strings
    def game_score
      if @player1.points == @player2.points && @player1.points < 3
        return "#{@player1.score} all!"
      elsif @player1.points == @player2.points && player2.points >= 3
        return "Deuce!"
      elsif @player1.points - @player2.points == 2
        return "#{@player1.name} wins"
      elsif @player2.points - @player1.points == 2
        return "#{@player2.name} wins"
      else
        return "#{@player1.score} #{@player2.score}"
      end

    end
  end

# Public: The Player Class descibes a player with attributes for points, 
#    #    opponent, and name
  class Player
  attr_accessor :points, :opponent, :name

#   # Public: Creates a Player Object with a name and points set to 0.
#   #
#   # name - The String that will become the name of the Player.
#   #
#   # Returns nothing
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

    # Tracks the player's score and assigns tennis naming as a string to score.
    # 
    # Returns the string name of score.
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