require 'colorize'

class Piece
  attr_reader :color

  def initialize(color, column, board)
    @color = color
    @board = board
    @pos = [0, column]
    fall_down  # could make this occur over time if you wanted moving pieces

    self
  end

  def fall_down
    @board.set(@pos, self)
    while @pos[0] != (@board.size - 1) && @board.get([@pos[0]+1, @pos[1]]).nil?
      @board.set(@pos, nil)
      @pos[0] += 1
      @board.set(@pos, self)
    end

    self
  end

  def winning?
    # brute force check every direction from this node, making bad assumption
    #   that this is the starting position, TODO: optimize
    directions = [1,1,0,-1,-1].permutation(2).to_a.uniq

    if directions.any? { |dir| count_to_end(dir) + 1 >= @board.connect }
      puts "#{self.color.capitalize} has won!"

      true
    else
      false
    end
  end

  def to_s
    'O'.colorize(color: @color.to_sym)
  end

  def count_to_end(direction)
    count = 0
    new_pos = [@pos[0] + direction[0], @pos[1] + direction[1]]
    while @board.on_board?(new_pos) && @board.get(new_pos) &&
          @board.get(new_pos).color == self.color
      new_pos = [new_pos[0] + direction[0], new_pos[1] + direction[1]]
      count += 1
    end

    count
  end
end
