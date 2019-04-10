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

    def display
        # print the column labels
        puts '  0 1 2 3 4 5 6 7 8'

        @grid.each_with_index do |row, row_num|
            # print the row label
            print "#{row_num} "

            # print the tiles depending on if they are flagged or revealed
            row.each_index do |column_num|
                print @grid[row_num][column_num].display
                print ' ' if column_num < 8
            end

            puts ''
        end
    end
end