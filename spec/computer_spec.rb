require 'computer'
require 'board'

RSpec.describe Computer do
  computer = Computer.new("Bob", "O")
  board = Board.new(3)
  context "is created with a name" do
    it "returns their name when name is called" do
      expect(computer.name).to eq("Bob")
    end
  end
  context "is created with a marking" do
    it "returns their name when name is called" do
      expect(computer.marking).to eq("O")
    end
  end

  context "generate a random position" do
    it "returns a number" do
      expect(computer.random_position(board)).to be_between(1, (board.size * board.size))
    end
  end

  context "can choose a random position" do
    it "returns updated board" do
      expect(computer.choose_position(board).flatten).to include("O")
    end
  end

end
