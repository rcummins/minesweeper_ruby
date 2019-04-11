# implement the user-interaction and game logic for minesweeper

require_relative 'board'

class Minesweeper
    def initialize
        @board = Board.new
        @board.add_bombs_to_grid
    end

    def draw_board
        @board.display
    end

    def reveal_or_flag(action, location)
        row, column = location

        if action == 'r'
            if @board.flagged?(row, column)
                puts "You must unflag this tile before you can reveal it"
            else
                @board.reveal_tile_and_neighbors(row, column)
            end
        elsif action == 'f'
            @board.flag_tile(row, column)
        end
    end

    def get_action_from_user
        print "Enter action code (r=reveal, f=flag/unflag, s=save game): "
        return parse_action_input(gets.chomp)
    end

    def get_location_from_user
        print "Enter the row and column separated by a comma (ex: 1,2) : "
        return parse_location_input(gets.chomp)
    end

    def parse_action_input(input)
        action = input.downcase
        raise('Incorrect action code') unless ['r', 'f', 's'].include?(action)
        return action
    end

    def parse_location_input(input)
        location = input.split(',').map(&:to_i)
        raise('Incorrect format') if location.length != 2
        raise('Invalid location') if location.min < 0 || location.max > 8
        return location
    end

    def lost?
        @board.bomb_revealed?
    end

    def won?
        @board.all_bomb_free_tiles_revealed? && !@board.bomb_revealed?
    end

    def game_over?
        lost? || won?
    end

    def display_when_game_over
        @board.reveal_whole_board
        @board.display
    end
end
