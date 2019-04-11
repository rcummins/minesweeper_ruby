# play the minesweeper game

require_relative 'minesweeper'

game = Minesweeper.new

until game.game_over?
    game.draw_board
    action = game.get_action_from_user
    location = game.get_location_from_user
    game.reveal_or_flag(action, location)
end

if game.won?
    puts "You won!"
else
    puts "Sorry, you lost"
end

game.display_when_game_over