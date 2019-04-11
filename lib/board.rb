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

    def reveal_tile_and_neighbors(row, column)
        tiles_to_reveal = [@grid[row][column]]

        # find all neighbors and neighbors of neighbors up to the fringe
        new_neighbor_found = true
        while new_neighbor_found
            new_neighbor_found = false

            tiles_to_reveal.each do |tile|
                next if tile.neighbor_bomb_count > 0

                possible_new_neighbors = tile.neighbors

                possible_new_neighbors.each do |possible_new_neighbor|
                    check_1 = possible_new_neighbor.has_bomb?
                    check_2 = tiles_to_reveal.include?(possible_new_neighbor)

                    unless check_1 || check_2
                        tiles_to_reveal << possible_new_neighbor
                        new_neighbor_found = true
                    end
                end
            end
        end

        # reveal this tile and all neighboring tiles up to the fringe
        tiles_to_reveal.each { |tile| tile.reveal }
    end

    def flag_tile(row, column)
        @grid[row][column].flag
    end

    def flagged?(row, column)
        @grid[row][column].flagged?
    end

    def bomb_revealed?
        @grid.flatten.any? { |tile| tile.has_bomb? && tile.revealed? }
    end

    def all_bomb_free_tiles_revealed?
        bomb_free_tiles = @grid.flatten.reject { |tile| tile.has_bomb? }
        return bomb_free_tiles.all? { |tile| tile.revealed? }
    end

    def reveal_whole_board
        @grid.flatten.each { |tile| tile.reveal }
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