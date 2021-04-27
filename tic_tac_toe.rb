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
    # @game_board.board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
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

    @game_board.display
  end

  def won?(*)
    win = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8], # rows
      [0, 3, 6], [1, 4, 7], [2, 5, 8], # columns
      [0, 4, 8], [2, 4, 6] # diagonals
    ].freeze

    win.any? do |combo|
      if @board[combo[0]] == @board[combo[1]] &&
         @board[combo[1]] == @board[combo[2]]
        if @board[combo[0]] == 'X'
          winner(@player1)
        else winner(@player2)
        end
      elsif full(board)
        puts "It's a tie!"
      else pick_space
      end
    end
  end

  def full(board)
    board.each do |spot|
      return false unless spot == ('X' || 'O')
    end
  end

  def winner(winner_name)
    puts "#{winner_name}, you win!"
  end

  def play_again
    loop do
      input = gets.chomp.upcase
      case input
      when 'Y'
        return true
      when 'N'
        return false
      end
    end
  end

  def game_loop
    game_play while play_again
  end

  def game_play
    @game_board.display
    pick_space
    won?
  end
end

game = PlayGame.new
game.player_info
game.game_play
