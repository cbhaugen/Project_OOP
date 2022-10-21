# frozen_string_literal: true

# Organizes the board
class Board
  attr_accessor :board

  def initialize
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def display
    puts '|-----------|'
    puts "| #{@board[0]} | #{@board[1]} | #{@board[2]} |"
    puts '|---+---+---|'
    puts "| #{@board[3]} | #{@board[4]} | #{@board[5]} |"
    puts '|---+---+---|'
    puts "| #{@board[6]} | #{@board[7]} | #{@board[8]} |"
    puts '|-----------|'
  end

  def check_board(choice, symbol)
    if @board&.include?(choice)
      @board[choice - 1] = symbol
    else
      puts 'Please choose a valid number'
      choice = gets.chomp
      check_board(choice, symbol)
    end
  end
end

# Defines the player
class Player
  attr_accessor :name, :symbol

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
  end
end

# Defines how the game is played
class PlayGame
  attr_accessor :game_board

  def initialize
    @play1turn = true
    @game_board = Board.new
  end

  def player_info
    puts 'Player 1, what is your name?'
    @player1 = Player.new(gets.strip, 'X')

    puts 'Player 2, what is your name?'
    @player2 = Player.new(gets.strip, 'O')

    puts "#{@player1.name}, you are X."
    puts "#{@player2.name}, you are O."
  end

  def pick_space
    case @play1turn
    when true
      turn(@player1.name, @player1.symbol)
      @play1turn = false
    when false
      turn(@player2.name, @player2.symbol)
      @play1turn = true
    else
      puts 'error'
    end
  end

  def turn(name, symbol)
    puts "#{name}, type a number to pick a spot."
    choice = gets.chomp.to_i
    @game_board.check_board(choice, symbol)
  end

  def won?
    winning_lines = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]
    ].freeze

    if winning_lines.any? { |line| line.all? { |spot| @game_board.board[spot] == 'X' } }
      winner(@player1)
    elsif winning_lines.any? { |line| line.all? { |spot| @game_board.board[spot] == 'O' } }
      winner(@player2)
    elsif full(@game_board.board)
      @game_board.display
      puts "It's a tie!"
      play_again
    else game_play
    end
  end

  def full(board)
    board.all? { |spot| spot.is_a? String }
  end

  def winner(winner)
    puts "#{winner.name}, you win!"
    play_again
  end

  def play_again
    puts 'Play again? Please press Y or N'
    input = gets.chomp.upcase
    case input
    when 'Y'
      play
    when 'N'
      puts 'Quitting Tic Tac Toe'
      exit(true)
    end
  end

  def game_play
    @game_board.display
    pick_space
    won?
  end
end

def play
  game = PlayGame.new
  game.player_info
  game.game_play
end

play
