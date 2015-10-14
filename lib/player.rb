class Player

  attr_reader :name, :marking
  def initialize(name, marking)
    @name = name
    @marking = marking
  end

  def choose_position (board)
    puts "#{@name}, what position would you like to choose?"
    position_choice = gets.chomp
    board.update_board(position_choice, self)
  end

end
