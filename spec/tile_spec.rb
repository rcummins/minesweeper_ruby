# test the Tile class for the minesweeper game

require 'RSpec'
require 'tile'

describe 'Tile' do
    let(:board) { Board.new }
    let(:tile) { board.grid[1][1] }

    describe '#initialize' do
        it 'sets the instance variable @has_bomb to false' do
            expect(tile.has_bomb?).to eq(false)
        end

        it 'sets the instance variable @revealed to false' do
            expect(tile.revealed?).to eq(false)
        end

        it 'sets the instance variable @flagged to false' do
            expect(tile.flagged?).to eq(false)
        end

        it 'sets the instance variable @board to a Board object' do
            expect(tile.board.class).to eq(Board)
        end

        it 'sets the instance variable @row to the expected value' do
            expect(tile.row).to eq(1)
        end

        it 'sets the instance variable @column to the expected value' do
            expect(tile.column).to eq(1)
        end
    end

    describe '#add_bomb' do
        it 'changes the instance variable @has_bomb to true' do
            tile.add_bomb
            expect(tile.has_bomb?).to eq(true)
        end
    end

    describe '#reveal' do
        it 'changes the instance variable @revealed to true' do
            tile.reveal
            expect(tile.revealed?).to eq(true)
        end
    end

    describe '#flag' do
        it 'changes @flagged to true if it was previously false' do
            tile.flag
            expect(tile.flagged?).to eq(true)
        end

        it 'changes @flagged to false if it was previously true' do
            tile.flag
            tile.flag
            expect(tile.flagged?).to eq(false)
        end
    end

    describe '#neighbors' do
        it 'returns the correct neighbors for an upper left corner tile' do
            neighbors = board.grid[0][0].neighbors
            expect(neighbors.length).to eq(3)
            expect(neighbors[0].row).to eq(0)
            expect(neighbors[0].column).to eq(1)
            expect(neighbors[1].row).to eq(1)
            expect(neighbors[1].column).to eq(0)
            expect(neighbors[2].row).to eq(1)
            expect(neighbors[2].column).to eq(1)
        end

        it 'returns the correct neighbors for an upper right corner tile' do
            neighbors = board.grid[0][8].neighbors
            expect(neighbors.length).to eq(3)
            expect(neighbors[0].row).to eq(0)
            expect(neighbors[0].column).to eq(7)
            expect(neighbors[1].row).to eq(1)
            expect(neighbors[1].column).to eq(7)
            expect(neighbors[2].row).to eq(1)
            expect(neighbors[2].column).to eq(8)
        end

        it 'returns the correct neighbors for a lower left corner tile' do
            neighbors = board.grid[8][0].neighbors
            expect(neighbors.length).to eq(3)
            expect(neighbors[0].row).to eq(7)
            expect(neighbors[0].column).to eq(0)
            expect(neighbors[1].row).to eq(7)
            expect(neighbors[1].column).to eq(1)
            expect(neighbors[2].row).to eq(8)
            expect(neighbors[2].column).to eq(1)
        end

        it 'returns the correct neighbors for a lower right corner tile' do
            neighbors = board.grid[8][8].neighbors
            expect(neighbors.length).to eq(3)
            expect(neighbors[0].row).to eq(7)
            expect(neighbors[0].column).to eq(7)
            expect(neighbors[1].row).to eq(7)
            expect(neighbors[1].column).to eq(8)
            expect(neighbors[2].row).to eq(8)
            expect(neighbors[2].column).to eq(7)
        end

        it 'returns the correct neighbors for an edge tile' do
            neighbors = board.grid[0][4].neighbors
            expect(neighbors.length).to eq(5)
            expect(neighbors[0].row).to eq(0)
            expect(neighbors[0].column).to eq(3)
            expect(neighbors[1].row).to eq(0)
            expect(neighbors[1].column).to eq(5)
            expect(neighbors[2].row).to eq(1)
            expect(neighbors[2].column).to eq(3)
            expect(neighbors[3].row).to eq(1)
            expect(neighbors[3].column).to eq(4)
            expect(neighbors[4].row).to eq(1)
            expect(neighbors[4].column).to eq(5)
        end

        it 'returns the correct neighbors for a central tile' do
            neighbors = board.grid[4][4].neighbors
            expect(neighbors.length).to eq(8)
            expect(neighbors[0].row).to eq(3)
            expect(neighbors[0].column).to eq(3)
            expect(neighbors[1].row).to eq(3)
            expect(neighbors[1].column).to eq(4)
            expect(neighbors[2].row).to eq(3)
            expect(neighbors[2].column).to eq(5)
            expect(neighbors[3].row).to eq(4)
            expect(neighbors[3].column).to eq(3)
            expect(neighbors[4].row).to eq(4)
            expect(neighbors[4].column).to eq(5)
            expect(neighbors[5].row).to eq(5)
            expect(neighbors[5].column).to eq(3)
            expect(neighbors[6].row).to eq(5)
            expect(neighbors[6].column).to eq(4)
            expect(neighbors[7].row).to eq(5)
            expect(neighbors[7].column).to eq(5)
        end
    end

    describe '#neighbor_bomb_count' do
        it 'returns zero when there are no bombs on the board' do
            expect(board.bomb_count).to eq(0)
            expect(tile.neighbor_bomb_count).to eq(0)
        end

        it 'returns 1 when one bomb as been placed in a neighboring tile' do
            board.grid[2][2].add_bomb
            expect(board.bomb_count).to eq(1)
            expect(tile.neighbor_bomb_count).to eq(1)
        end
    end
end