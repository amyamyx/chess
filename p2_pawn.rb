require_relative 'p0_piece'

class Pawn < Piece
  attr_reader :symbol

  def symbol
    @symbol = "♙".colorize(@color)
  end

  def move_dirs
    @color == :blue ? [1, 0] : [-1, 0]
  end

end
