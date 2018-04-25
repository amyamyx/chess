require_relative 'Stepable'
require_relative 'piece'
require_relative 'display'

class King < Piece
  include Stepable
  attr_reader :symbol

  # def initialize(color,board,pos)
  #   super(color,board,pos)
  #
  #   @move_dirs = CARTESIAN_DIRS
  # end

  def symbol
    @symbol = "♚".colorize(@color)
  end

  def move_dirs
    a = [1,1,-1,-1,0,0]
    c = a.combination(2).to_a.uniq
    c.delete([0,0])
    c
  end


end
