class Board

  #  won logic:
  #  traverse along diagonals, horizontal, and verticals until reaching an empty
  #  or non-friendly space.  If count reaches 'k', then game is won. Do this for
  #  every piece on board.

  # game-over if board is full and no winning sets

  attr_reader :grid, :size

  def initialize(options={})
    defaults = { size: 7, connect: 4 }
    options = defaults.merge(options)

    @size = options[:size]
    @grid = Array.new(@size) { Array.new(@size) { nil } }
  end

  def make_move(color, column)
    if @grid[0][colulmn].nil?
      @grid[0][column] = Piece.new(column, board)
    else
      throw 'Invalid move'
    end
  end

  



end
