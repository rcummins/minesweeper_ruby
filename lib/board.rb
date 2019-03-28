# implement the Board class for the minesweeper game

require_relative 'tile'

class Board
    attr_reader :grid

    def initialize
        @grid = Array.new(9) { Array.new(9) { Tile.new } }
    end
end