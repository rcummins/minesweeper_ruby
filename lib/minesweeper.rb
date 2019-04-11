# implement the user-interaction and game logic for minesweeper

require_relative 'board'

class Minesweeper
    def initialize
        @board = Board.new
        @board.add_bombs_to_grid
    end

    def take_turn
        @board.display

        action, row, column = get_user_input

        if action == 'r'
            @board.reveal_tile_and_neighbors(row, column)
        else
            @board.flag_tile(row, column)
        end
    end

    def get_user_input
        print "Enter action (r=reveal, f=flag/unflag) row, column (ex: r2,3): "
        return parse_input(gets.chomp)
    end

    def parse_input(input)
        action = input[0].downcase
        raise('Incorrect action code') unless ['r', 'f'].include?(action)
        row_column = input[1..-1].split(',').map(&:to_i)
        raise('Incorrect format') if row_column.length != 2
        raise('Invalid location') if row_column.min < 0 || row_column.max > 8
        return [action] + row_column
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
