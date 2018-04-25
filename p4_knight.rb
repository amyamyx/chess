require_relative 'm1_stepable'
require_relative 'p0_piece'

class Knight < Piece
  include Stepable
  attr_reader :symbol

  def symbol
    @symbol = "♘".colorize(@color)
  end

  def move_dirs
    [[-1,-2],[-2,-1],[-2,1],[-1,2],[1,2],[2,1],[2,-1],[1,-2]]
  end
end
