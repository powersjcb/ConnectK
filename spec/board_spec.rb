require 'spec_helper'
require 'board'
require 'byebug'

RSpec.describe Board do

  context '#initialize with defaults' do
    before(:each) { @board = Board.new }

    it 'creates a board with correct default size' do
    end

    it 'starts with an empty grid' do
      expect(@board.grid.flatten.compact.length).to eq(0)
    end
  end

  context '#set' do
    before(:each) { @board = Board.new }

    it 'raises an error for invalid grid positions' do
      pos = [-256, 2]
      expect{@board.set(pos, 1)}.to raise_error "Position is off the board"
    end

    it 'correctly sets the value of a grid element' do
      pos = [0,0]
      expect(@board.set(pos, 1).grid[0][0]).to eq(1)
    end
  end

  context '#get' do
    before(:each) { @board = Board.new }

    it 'raises an error for invalid grid positions' do
      pos = [-256, 2]
      expect{@board.get(pos)}.to raise_error "Position is off the board"
    end

    it 'correctly gets the value of a grid element' do
      pos = [1,1]
      @board.set(pos, 1)
      expect(@board.get(pos)).to eq(1)
    end
  end

  context '#make_move' do
    before(:each) { @board = Board.new }

    it 'calls Piece.new and passes: color, column, self'

  end
end
