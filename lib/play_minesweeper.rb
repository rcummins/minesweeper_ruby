# play the minesweeper game

require_relative 'minesweeper'

game = Minesweeper.new

until game.game_over?
    game.take_turn
end

game.display_when_game_over

if game.won?
    puts "You won!"
else
    puts "Sorry, you lost"
end