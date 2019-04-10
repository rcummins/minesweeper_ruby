# play the minesweeper game

require_relative 'minesweeper'

game = Minesweeper.new
game.take_turn

game.display_when_game_over