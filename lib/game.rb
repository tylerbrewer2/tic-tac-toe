class Game

  def initialize
    @board = nil
    @win_checker = nil
    @current_player = nil
    set_up_game
    play_turn(@player1)
  end

  def set_up_game
    puts "=" * 30
    puts
    puts "Welcome Traveler! Happy almost Halloween!"
    puts
    puts "_______     |_|     _______"
    puts "\\      \\____|_|____/      /"
    puts " \\         BATMAN        / "
    puts "  \\_________   _________/   "
    puts "            \\ /             "
    puts
    puts "=" * 30
    puts
    puts "How large would you like the board size to be?(numbers only please)"
    number_choice = gets.chomp
    @board = Board.new(number_choice.to_i)
    @win_checker = WinCheck.new(self, @board)
    puts "Player-1, would you like to be X or O"
    player1_choice = gets.chomp.downcase
    if player1_choice == "x"
      @player1 = Player.new("Player1", "X")
      @computer = Computer.new("Computer", "O")
      @current_player = @player1
    elsif player1_choice == "o"
      @player1 = Player.new("Player1", "O")
      @computer = Computer.new("Computer", "X")
      @current_player = @player1
    else
      "Please enter a valid input"
      set_up_game
    end
  end

  def play_turn(player)
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

end
