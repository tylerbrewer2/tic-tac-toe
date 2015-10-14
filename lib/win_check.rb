class WinCheck

  def initialize(game, board)
    @game = game
    @board = board
  end

  def run
    if horizontal || vertical || diagnal
      binding.pry
      true
    end
  end

  def check (arr)
    if arr.flatten == ("X" * @board.size) || arr.flatten == ("O" * @board.size)
      true
    end
  end

  def horizontal
    win = nil
    @board.size.times do |n|
      @board.current_board.each do |row|
        check(row) # checks each row in win_check
        if check(row)
          binding.pry
          win = true
        end
      end
    end
    win
  end

  def vertical
    win = nil
    @board.size.times do |n|
      row_inputs = []
      @board.current_board.each do |row|
        row_inputs << row[n]
      end
      if check(row_inputs) # check each column in win_check
        win = true
      end
    end
    win
  end

  def diagnal
    row_inputs1 = []
    row_inputs2 = []
    win = false

    @board.size.times do |n|
      @board.current_board.each do |row|
        row_inputs1 << @board.current_board[-n - 1]
      end
    end

    @board.size.times do |n|
      @board.current_board.each do |row|
        row_inputs2 << @board.current_board[n]
      end
    end

    if check(row_inputs1) || check(row_inputs2)
      win = true
    end
    win
  end

end