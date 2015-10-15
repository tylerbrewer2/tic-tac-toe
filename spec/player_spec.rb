require 'player'
require 'board'

RSpec.describe Player do
  player = Player.new("Tyler", "X")
  board = Board.new(3)
  context "is created with a name" do
    it "returns their name when name is called" do
      expect(player.name).to eq("Tyler")
    end
  end
  context "is created with a marking" do
    it "returns their name when name is called" do
      expect(player.marking).to eq("X")
    end
  end

  context "is able to choose a position" do
    it "updates board to be updated" do
      # enter 1 on this test
      expect(player.choose_position(board)).to eq([["X", 2, 3], [4, 5, 6], [7, 8, 9]])
    end
  end
end
