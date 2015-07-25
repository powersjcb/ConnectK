require_relative 'board'
class Game

  def setup
    puts "Enter the size of the board"
    grid_size = get_user_input

    puts "Enter number to connect for a win"
    connect_count = get_user_input

    @board = Board.new({ size: grid_size, connect: connect_count })
  end

  def play
    setup

    until @board.is_won? || @board.game_over
      puts "#{@board.turn.capitalize}'s turn"
      @board.render
      puts 'Pick a column'
      column = get_user_input
      @board.make_move(column)
    end
    @board.render
  end

  def get_user_input
    gets.chomp.to_i
  end

end

Game.new.play
