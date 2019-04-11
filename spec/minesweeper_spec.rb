# test the implementation of minesweeper game logic

require 'RSpec'
require 'minesweeper'

describe 'Minesweeper' do
    let(:game) { Minesweeper.new }

    describe '#parse_input' do
        it 'returns correct array when input is formatted correctly' do
            expect(game.parse_input('r1,2')).to eq(['r', 1, 2])
            expect(game.parse_input('f3,4')).to eq(['f', 3, 4])
            expect(game.parse_input('R5,6')).to eq(['r', 5, 6])
            expect(game.parse_input('F7,8')).to eq(['f', 7, 8])
        end

        it 'raises an error if the action is anything except r or f' do
            expect{game.parse_input('a1,2')}.to raise_error('Incorrect action code')
            expect{game.parse_input('1,2')}.to raise_error('Incorrect action code')
        end

        it 'raises an error if there is only one or more than two numbers' do
            expect{game.parse_input('r1')}.to raise_error('Incorrect format')
            expect{game.parse_input('f1,2,3')}.to raise_error('Incorrect format')
        end

        it 'raises an error if the numbers are off the board' do
            expect{game.parse_input('r-1,0')}.to raise_error('Invalid location')
            expect{game.parse_input('f9,0')}.to raise_error('Invalid location')
        end
    end
end
