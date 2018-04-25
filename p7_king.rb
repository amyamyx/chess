require_relative 'm1_stepable'
require_relative 'p0_piece'

class King < Piece
  include Stepable
  attr_reader :symbol

  def symbol
    @symbol = "♔".colorize(@color)
  end

  def move_dirs
    a = [1,1,-1,-1,0,0]
    c = a.combination(2).to_a.uniq
    c.delete([0,0])
    c
  end
end
