# test the implementation of minesweeper game logic

require 'RSpec'
require 'minesweeper'

describe 'Minesweeper' do
    let(:game) { Minesweeper.new }

    describe '#parse_input' do
        it 'returns an array of 2 numbers when input is formatted correctly' do
            expect(game.parse_input('1,2')).to eq([1, 2])
        end

        it 'raises an error if there is only one or more than two numbers' do
            expect{game.parse_input('1')}.to raise_error('Incorrect format')
            expect{game.parse_input('1,2,3')}.to raise_error('Incorrect format')
        end

        it 'raises an error if the numbers are off the board' do
            expect{game.parse_input('-1,0')}.to raise_error('Invalid location')
            expect{game.parse_input('9,0')}.to raise_error('Invalid location')
        end
    end
end