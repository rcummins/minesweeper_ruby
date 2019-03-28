# test the Tile class for the minesweeper game

require 'RSpec'
require 'tile'

describe 'Tile' do
    let(:tile) { Tile.new }

    describe '#initialize' do
        it 'sets the instance variable @has_bomb? to false' do
            expect(tile.has_bomb?).to eq(false)
        end

        it 'sets the instance variable @revealed? to false' do
            expect(tile.revealed?).to eq(false)
        end

        it 'sets the instance variable @flagged? to false' do
            expect(tile.flagged?).to eq(false)
        end
    end

    describe '#add_bomb' do
        xit 'changes the instance variable @has_bomb? to true' do
            tile.add_bomb
            expect(tile.has_bomb?).to eq(true)
        end
    end
end