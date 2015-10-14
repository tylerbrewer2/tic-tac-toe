class Board
  attr_reader :size, :current_board
  def initialize(size)
    @size = size.to_i
    @current_board = create_board(size)
  end

  def create_board(desired_size)
    row_array = []
    board_array = []
    1.upto(size * size) do |n|
      if n % desired_size.to_i == 0
        row_array << n
        board_array << row_array
        row_array = []
      else
        row_array << n
      end
    end
    board_array
  end

  def show_board
    @size.times do |n|
      puts @current_board[n].inspect
    end
  end

  def update_board(position, player)
    @current_board.each do |row|
      index = row.index(position.to_i)
      if index
        row[index] = player.marking
      end
    end
  end

end
