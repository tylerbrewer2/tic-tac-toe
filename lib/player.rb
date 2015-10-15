class Player

  attr_reader :name, :marking
  def initialize(name, marking)
    @name = name
    @marking = marking
  end

  def choose_position (board)
    puts "#{@name}, what position would you like to choose?"
    position_choice = gets.chomp
    if !board.past_moves.include?(position_choice.to_i)
      board.update_board(position_choice, self)
    else
      puts "That position is already filled!"
      choose_position(board)
    end
  end

end
