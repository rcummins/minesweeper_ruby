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

    describe '#flag_tile' do
        it 'flags a tile if it was previously unflagged' do
            board.flag_tile(0, 0)
            expect(board.grid[0][0].flagged?).to eq(true)
        end

        it 'unflags a tile if it was previously flagged' do
            board.grid[0][0].flag
            expect(board.grid[0][0].flagged?).to eq(true)
            board.flag_tile(0, 0)
            expect(board.grid[0][0].flagged?).to eq(false)
        end
    end

    describe '#bomb_revealed?' do
        it 'returns false if no bombs are revealed' do
            board.grid[0][0].reveal
            expect(board.bomb_revealed?).to eq(false)
        end

        it 'returns true if a bomb is revealed' do
            board.grid[0][0].add_bomb
            board.grid[0][0].reveal
            expect(board.bomb_revealed?).to eq(true)
        end
    end

    describe '#all_bomb_free_tiles_revealed?' do
        it 'returns false if some bomb-free tiles are not revealed' do
            board.grid[0][0].add_bomb
            board.grid[0][1].reveal
            expect(board.all_bomb_free_tiles_revealed?).to eq(false)
        end

        it 'returns true if all bomb-free tiles are revealed' do
            board.grid[0][0].add_bomb
            (0..8).each do |row|
                (0..8).each do |column|
                    board.grid[row][column].reveal unless row==0 && column==0
                end
            end
            expect(board.all_bomb_free_tiles_revealed?).to eq(true)
        end
    end
end