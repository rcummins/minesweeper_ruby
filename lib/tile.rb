# implement the Tile class for the minesweeper game

class Tile
    def initialize
        @has_bomb = false
        @revealed = false
        @flagged = false
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
end