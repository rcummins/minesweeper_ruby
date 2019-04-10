# implement the Tile class for the minesweeper game

require_relative 'board'

class Tile
    attr_reader :board, :row, :column

    def initialize(board, row, column)
        @has_bomb = false
        @revealed = false
        @flagged = false
        @board = board
        @row = row
        @column = column
    end

    def has_bomb?
        @has_bomb
    end

    def revealed?
        @revealed
    end

    def flagged?
        @flagged
    end

    def add_bomb
        @has_bomb = true
    end

    def reveal
        @revealed = true
    end

    def flag
        if @flagged == false
            @flagged = true
        else
            @flagged = false
        end
    end
end