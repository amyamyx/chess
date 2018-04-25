require_relative 'Stepable'
require_relative 'piece'
require_relative 'display'

class Knight < Piece
  include Stepable
  attr_reader :symbol

  # def initialize(color,board,pos)
  #   super(color,board,pos)
  #
  #   @move_dirs = CARTESIAN_DIRS
  # end

  def symbol
    @symbol = "♞".colorize(@color)
  end

  def move_dirs
    [[-1,-2],[-2,-1],[-2,1],[-1,2],[1,2],[2,1],[2,-1],[1,-2]]
  end


end
