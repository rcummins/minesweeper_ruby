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

    def neighbors
        all_neighbors = []

        (-1..1).each do |row_offset|
            (-1..1).each do |column_offset|
                next if row_offset == 0 && column_offset == 0

                new_row = @row + row_offset
                new_column = @column + column_offset

                next if new_row < 0 || new_column < 0
                next if new_row > 8 || new_column > 8

                all_neighbors << @board.grid[new_row][new_column]
            end
        end

        return all_neighbors
    end

    def neighbor_bomb_count
        neighbors.count { |tile| tile.has_bomb? }
    end

    def inspect
        output = ''
        output += "row: #{@row}, "
        output += "column: #{@column}, "
        output += "has bomb: #{@has_bomb}, "
        output += "revealed: #{@revealed}, "
        output += "flagged: #{@flagged}"
        output += "\n"
        return output
    end

    def display
        if @flagged == true
            'F'
        elsif @revealed == true && @has_bomb == true
            '*'
        elsif @revealed == true && neighbor_bomb_count > 0
            neighbor_bomb_count.to_s
        elsif @revealed == true && neighbor_bomb_count == 0
            '_'
        else
            '?'
        end
    end
end