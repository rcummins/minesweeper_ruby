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