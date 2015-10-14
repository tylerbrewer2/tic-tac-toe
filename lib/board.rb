class Board
  attr_reader :size, :current_board
  def initialize(size)
    @size = size
    @current_board = create_board
  end

  def create_board
    [[1,2,3],
     [4,5,6],
     [7,8,9]]
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
