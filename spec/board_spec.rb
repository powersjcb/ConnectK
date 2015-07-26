require 'spec_helper'
require 'board'

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
    before(:each) { @board = Board.new(size: 4, connect: 2) }

    it "places creates a new Piece on the first move" do
      @board.make_move(0)
      expect(@board.get([3,0]).class).to be Piece
    end

    it "alternates colors on each turn" do
      @board.make_move(0)
      @board.make_move(0)
      first_color  = @board.get([3,0]).color
      second_color = @board.get([2,0]).color
      expect([first_color, second_color]).to eq(['red', 'green'])
    end
  end

  context '#is_won?' do
    before(:each) { @board = Board.new(size: 4, connect: 2) }

    it 'correctly returns that the game is not won yet' do
      @board.make_move(0)
      @board.make_move(0)
      expect(@board.is_won?).to be false
    end

    it 'correctly returns that the game has been won' do
      @board.make_move(0)
      @board.make_move(1)
      @board.make_move(0)
      expect(@board.is_won?).to be true
    end

  end
end
