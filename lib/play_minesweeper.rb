# play the minesweeper game

require_relative 'minesweeper'

game = Minesweeper.new

until game.game_over?
    game.draw_board
    user_input = game.get_user_input
    game.respond_to_input(user_input)
end

if game.won?
    puts "You won!"
else
    puts "Sorry, you lost"
end

game.display_when_game_over