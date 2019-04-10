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

        it 'passes the correct row and column to each tile' do
            row_col_match = []
            board.grid.each_index do |row|
                board.grid[row].each_index do |column|
                    row_col_match << board.grid[row][column].row == row
                    row_col_match << board.grid[row][column].column == column
                end
            end
            expect(row_col_match.all?).to eq(true)
            expect(row_col_match.length).to eq(162)
        end
    end

    describe '#add_bombs_to_grid' do
        it 'adds bombs to 10 tiles in the grid' do
            board.add_bombs_to_grid
            bomb_count = board.grid.flatten.count { |tile| tile.has_bomb? }
            expect(bomb_count).to eq(10)
        end
    end

    describe '#bomb_count' do
        it 'returns zero before bombs are added to grid' do
            expect(board.bomb_count).to eq(0)
        end

        it 'returns 1 if one bomb has been added to grid' do
            board.grid[0][0].add_bomb
            expect(board.bomb_count).to eq(1)
        end

        it 'returns 2 if two bombs have been added to grid' do
            board.grid[0][0].add_bomb
            board.grid[0][1].add_bomb
            expect(board.bomb_count).to eq(2)
        end
    end
end