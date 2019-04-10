# implement the Board class for the minesweeper game

require_relative 'tile'

class Board
    attr_reader :grid

    def initialize
        @grid = Array.new(9) { Array.new(9) }
        populate_grid_with_tiles
    end

    def populate_grid_with_tiles
        @grid.each_index do |row|
            @grid[row].each_index do |column|
                @grid[row][column] = Tile.new(self, row, column)
            end
        end
    end

    def add_bombs_to_grid
        until bomb_count == 10
            row = rand(9)
            column = rand(9)
            @grid[row][column].add_bomb
        end
    end

    def bomb_count
        @grid.flatten.count { |tile| tile.has_bomb? }
    end
end