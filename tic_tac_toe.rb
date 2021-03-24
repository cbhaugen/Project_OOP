class Board

  attr_reader :PlayGame, :Player

  def initialize()
    @@board = ['1', '2', '3', '4', '5', '6', '7', '8', '9']
  end

  def board
    @@board
  end

  def display_board
    puts "|-----------|"
    puts "| #{@@board[0]} | #{@@board[1]} | #{@@board[2]} |"
    puts "|---+---+---|"
    puts "| #{@@board[3]} | #{@@board[4]} | #{@@board[5]} |"
    puts "|---+---+---|"
    puts "| #{@@board[6]} | #{@@board[7]} | #{@@board[8]} |"
    puts "|-----------|"
  end

  def self.check_board(choice, symbol)
    if @@board&.include?(choice)
      @@board[choice.to_i - 1] = symbol
    else
      puts "Please choose a valid number"
      choice = gets.chomp
      self.check_board(choice, symbol)
    end
  end

end


class Player

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
  end

  def name
    @name
  end

  def symbol
    @symbol
  end

end


class PlayGame
  attr_accessor :Board, :Player

  def initialize
    @play1turn = true
  end

  def player_info
    puts "Player 1, what is your name?"
    @player1 = Player.new(gets.strip, "X")

    puts "Player 2, what is your name?"
    @player2 = Player.new(gets.strip, "O")

    puts "#{@player1.name}, you are X."
    puts "#{@player2.name}, you are O."
    game_board = Board.new()
    game_board.display_board
  end

  def pick_space
    case @play1turn
    when true
      puts "#{@player1.name}, type a number to pick a spot."
      choice = gets.chomp
      Board.check_board(choice, @player1.symbol)
      @play1turn = false
    when false
      puts "#{@player2.name}, type a number to pick a spot."
      choice = gets.chomp
      Board.check_board(choice, @player2.symbol)
      @play1turn = true
    else
      puts "error"
    end

  end

end

new_game = PlayGame.new()
new_game.player_info
new_game.pick_space

#define turn
  #pick a space
  #player can't play on taken space

#define when game is over
  #winning combinations
    #define top row, middle row, etc
  #define full board
  #tie situations
    #entire board is full but no winning combinations

#game play
  #display board
  #player take turn
  #check for game over (if not, back to display board, if so, puts winner lines)
