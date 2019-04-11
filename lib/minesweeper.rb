# implement the user-interaction and game logic for minesweeper

require_relative 'board'

class Minesweeper
    def initialize
        @board = Board.new
        @board.add_bombs_to_grid
    end

    def take_turn
        @board.display
        row, column = get_user_input
        @board.reveal_tile_and_neighbors(row, column)
    end

    def get_user_input
        print "Enter a row number and column number separated by a comma: "
        return parse_input(gets.chomp)
    end

    def parse_input(input)
        row_column = input.split(',').map(&:to_i)
        raise('Incorrect format') if row_column.length != 2
        raise('Invalid location') if row_column.min < 0 || row_column.max > 8
        return row_column
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