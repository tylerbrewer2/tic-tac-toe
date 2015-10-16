class Game

  def initialize
    @move_count = 0
    set_up_game
    play_turn(@current_player)
  end

  def set_up_game
    batman!
    get_board_size
    @win_checker = WinCheck.new(self, @board)
    choose_marker
    randomize?
  end

  def play_turn(player)
    maximum_moves?
    @board.show_board
    player.choose_position(@board)
    if @win_checker.run
      puts "#{player.name} wins!"
      play_again?
    else
      play_turn(next_player)
    end
  end

  def next_player
    if @current_player == @player1
      @current_player = @computer
    else
      @current_player = @player1
    end
  end

  def play_again?
    puts "Would you like to play again? (yes/no)"
    input = gets.chomp.downcase
    if input == "yes"
      Game.new
    else
      puts "Thanks for playing!"
    end
  end

  def maximum_moves?
    if @move_count >= (@board.size * @board.size)
      puts "It's a draw!"
      play_again?
    end
  end

  def batman!
    puts "=" * 30
    puts
    puts "Welcome Traveler! Happy almost Halloween!"
    puts
    puts "_______     |_|     _______"
    puts "\\      \\____|_|____/      /"
    puts "  \\       BATMAN        / "
    puts "   \\________   ________/   "
    puts "            \\ /             "
    puts
    puts "=" * 30
    puts
  end

  def get_board_size
    puts "How large would you like the board size to be?(numbers only please)"
    number_choice = gets.chomp
    if number_choice.to_i != 0
      @board = Board.new(number_choice.to_i)
    else
      puts "Numbers only, please!"
      get_board_size
    end
  end

  def choose_marker
    puts "Player-1, would you like to be X or O"
    player1_choice = gets.chomp.downcase
    if player1_choice == "x"
      @player1 = Player.new("Player1", "X")
      @computer = Computer.new("Computer", "O")
    elsif player1_choice == "o"
      @player1 = Player.new("Player1", "O")
      @computer = Computer.new("Computer", "X")
    else
      puts "Please enter 'X' or 'O'"
      choose_marker
    end
  end

  def randomize?
    puts "Would you like to randomize who goes first?"
    input = gets.chomp.downcase
    if input == "yes"
      get_random_player
    elsif input == "no"
      @current_player = @player1
    else
      puts "Please enter 'yes' or 'no'"
      randomize?
    end
  end

  def get_random_player
    random_number = 2
    if random_number == 1
      @current_player = @player1
    else
      @current_player = @computer
    end
  end
end
