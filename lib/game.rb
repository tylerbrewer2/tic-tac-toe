class Game
  
  def initialize(board_size)
    @board = Board.new(board_size)
    @win_checker = WinCheck.new(self, @board)
    @current_player = nil
    set_up_game
    play_turn(@player1)
  end

  def set_up_game
    puts "Welcome to Tic-Tac-Toe! (insert corny game music here)"
    puts "Player-1, would you like to be X or O"
    player1_choice = gets.chomp.downcase
    if player1_choice == "x"
      @player1 = Player.new("Player1", "X")
      @computer = Player.new("Computer", "O")
      @current_player = @player1
    elsif player1_choice == "o"
      @player1 = Player.new("Player1", "O")
      @computer = Player.new("Computer", "X")
      @current_player = @player1
    else
      "Please enter a valid input"
      set_up_game
    end
  end

  def play_turn(player)
    @board.show_board
    puts "#{player.name}, what position would you like to choose?"
    position_choice = gets.chomp
    @board.update_board(position_choice, player)
    if @win_checker.run
      puts "#{player.name} wins!"
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

end
