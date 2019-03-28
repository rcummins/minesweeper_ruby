# implement the Tile class for the minesweeper game

class Tile
    attr_reader :has_bomb, :revealed, :flagged

    def initialize
        @has_bomb = false
        @revealed = false
        @flagged = false
    end
end