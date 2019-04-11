# test the implementation of minesweeper game logic

require 'RSpec'
require 'minesweeper'

describe 'Minesweeper' do
    let(:game) { Minesweeper.new }

    describe '#parse_action_input' do
        it 'returns correct string when input is formatted correctly' do
            expect(game.parse_action_input('r')).to eq('r')
            expect(game.parse_action_input('f')).to eq('f')
            expect(game.parse_action_input('s')).to eq('s')
            expect(game.parse_action_input('R')).to eq('r')
            expect(game.parse_action_input('F')).to eq('f')
            expect(game.parse_action_input('S')).to eq('s')
        end

        it 'raises an error if the action is anything except r, f or s' do
            expect{game.parse_action_input('a')}.to raise_error('Incorrect action code')
            expect{game.parse_action_input('1')}.to raise_error('Incorrect action code')
            expect{game.parse_action_input('')}.to raise_error('Incorrect action code')
        end
    end

    describe '#parse_location_input' do
        it 'returns correct string when input is formatted correctly' do
            expect(game.parse_location_input('1,2')).to eq([1, 2])
        end

        it 'raises an error if there are fewer or more than two numbers' do
            expect{game.parse_location_input('')}.to raise_error('Incorrect format')
            expect{game.parse_location_input('a')}.to raise_error('Incorrect format')
            expect{game.parse_location_input('1')}.to raise_error('Incorrect format')
            expect{game.parse_location_input('1,2,3')}.to raise_error('Incorrect format')
        end

        it 'raises an error if the numbers are off the board' do
            expect{game.parse_location_input('-1,0')}.to raise_error('Invalid location')
            expect{game.parse_location_input('9,0')}.to raise_error('Invalid location')
        end
    end
end
