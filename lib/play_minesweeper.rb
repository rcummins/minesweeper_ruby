# play the minesweeper game

require 'yaml'
require_relative 'minesweeper'

if ARGV.empty?
    game = Minesweeper.new
else
    game = YAML.load(File.read(ARGV.shift))
end

until game.game_over?
    game.draw_board

    action = game.get_action_from_user

    if action == 's'
        file_name = game.get_file_name_from_user + '.txt'
        File.open(file_name, 'w') { |f| f.puts game.to_yaml }
    else
        location = game.get_location_from_user
        game.reveal_or_flag(action, location)
    end
end

if game.won?
    puts "You won!"
else
    puts "Sorry, you lost"
end

game.display_when_game_over