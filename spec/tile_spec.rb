# test the Tile class for the minesweeper game

require 'RSpec'
require 'tile'

describe 'Tile' do
    let(:tile) { Tile.new }

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
end