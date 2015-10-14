class Computer

  attr_reader :name, :marking
  def initialize(name, marking)
    @name = name
    @marking = marking
  end

  def choose_position (board)
    position = random_position(board)
    puts "#{@name}, chooses position #{position}"
    board.update_board(position, self)
  end

  def random_position(board)
    position = nil
    while position.class != Fixnum
      position = board.current_board.sample.sample
    end
    position
  end

end
