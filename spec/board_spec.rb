# test the Board class for the minesweeper game

require 'RSpec'
require 'board'

describe 'Board' do
    let(:board) { Board.new }

    describe '#initialize' do
        it 'sets @grid to a 9x9 2D array' do
            expect(board.grid.class).to eq(Array)
            expect(board.grid[0].class).to eq(Array)
            expect(board.grid.length).to eq(9)
            expect(board.grid[0].length).to eq(9)
        end

        it 'sets @grid to a 2D array containing tiles' do
            expect(board.grid[0][0].class).to eq(Tile)
        end
    end
end