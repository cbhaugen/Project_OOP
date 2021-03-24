Project at [The Odin Project](https://www.theodinproject.com/courses/ruby-programming/lessons/oop?ref=lnav)

Project 1: Tic Tac Toe

Remember Tic Tac Toe? See [Wikipedia](https://en.wikipedia.org/wiki/Tic-tac-toe) if you can’t remember the rules, or if you haven’t ever played. It involves a couple of players, a simple board, checking for victory in a game loop… all the conditions that make it a fun little problem to solve using our newfound OOP sea legs. Let’s build it!

Assignment 1

Build a tic-tac-toe game on the command line where two human players can play against each other and the board is displayed in between turns.

  1. Think about how you would set up the different elements within the game… What should be a class? Instance variable? Method? A few minutes of thought can save you from wasting an hour of coding.

  2. Build your game, taking care to not share information between classes any more than you have to.



Project 2: Mastermind

If you’ve never played Mastermind, a game where you have to guess your opponent’s secret code within a certain number of turns (like hangman with colored pegs), check it out on [Wikipedia](https://en.wikipedia.org/wiki/Mastermind_(board_game)). Each turn you get some feedback about how good your guess was – whether it was exactly correct or just the correct color but in the wrong space.

Assignment 2

Build a Mastermind game from the command line where you have 12 turns to guess the secret code, starting with you guessing the computer’s random code.

  1. Think about how you would set this problem up!

  2. Build the game assuming the computer randomly selects the secret colors and the human player must guess them. Remember that you need to give the proper feedback on how good the guess was each turn!

  3. Now refactor your code to allow the human player to choose whether he/she wants to be the creator of the secret code or the guesser.

  4. Build it out so that the computer will guess if you decide to choose your own secret colors. You may choose to implement a computer strategy that follows the rules of the game or you can modify these rules.

  5. If you choose to modify the rules, you can provide the computer additional information about each guess. For example, you can start by having the computer guess randomly, but keep the ones that match exactly. You can add a little bit more intelligence to the computer player so that, if the computer has guessed the right color but the wrong position, its next guess will need to include that color somewhere.

  6. If you want to follow the rules of the game, you’ll need to research strategies for solving Mastermind, such as this [post](https://puzzling.stackexchange.com/questions/546/clever-ways-to-solve-mastermind).
