# implement the user-interaction and game logic for minesweeper

require_relative 'board'

class Minesweeper
    attr_accessor :board # for testing purposes

    def initialize
        @board = Board.new
        @board.add_bombs_to_grid
    end

    def take_turn
        @board.display
        @board.reveal_tile_and_neighbors(0, 0)
        @board.display
    end

    def display_when_game_over
        @board.reveal_whole_board
        @board.display
    end
end