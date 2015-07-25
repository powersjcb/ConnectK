require_relative 'piece'

class Board

  #  won logic:
  #  traverse along diagonals, horizontal, and verticals until reaching an empty
  #  or non-friendly space.  If count reaches 'k', then game is won. Do this for
  #  every piece on board.

  # game-over if board is full and no winning sets

  attr_reader :grid, :size, :connect

  def initialize(options={})
    defaults = { size: 7, connect: 4 }
    options = defaults.merge(options)
    @connect = options[:connect]
    @size = options[:size]
    @grid = Array.new(@size) { Array.new(@size) { nil } }
  end

  def set(pos, val)
    if on_board?(pos)
      @grid[pos[0]][pos[1]] = val
    else
      raise 'Position is off the board'
    end

    self
  end

  def get(pos)
    if on_board?(pos)
      @grid[pos[0]][pos[1]]
    else
      raise 'Position is off the board'
    end
  end

  def make_move(color, column)
    if @grid[0][column].nil? && column >= 0 && column < @size
      # piece will insert itself and fall down in initialize method
      Piece.new(color, column, self)
    else
      raise 'Invalid move'
    end
  end

  def is_won?
    @grid.flatten.compact.any? { |piece| piece.winning? }
  end


  def render

    puts '   ' + (0...@size).to_a.join('| ')
    @grid.each.with_index do |row, i|
      raster_line = [i]
      row.each.with_index do |el, j|
        if el.nil?
          raster_line << ' '
        else
          raster_line << el
        end
      end
      puts raster_line.join('|_')
    end
  end

  def on_board?(pos)
    pos[0] >= 0 && pos[0] < @size && pos[1] >= 0 && pos[1] < @size
  end
end


b = Board.new
b.make_move('red', 0)
b.make_move('red', 1)
b.make_move('red', 2)
b.make_move('red', 3)
p b.is_won?





b.render
