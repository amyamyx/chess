require_relative 'piece'
require_relative 'display'

class Pawn < Piece
  attr_reader :symbol

  # def initialize(color,board,pos)
  #   super(color,board,pos)
  #
  #   @move_dirs = CARTESIAN_DIRS
  # end

  def symbol
    @symbol = "♟".colorize(@color)
  end

  def move_dirs
    if @color == :blue
      a = [1,0]
    else
      a = [-1,0]
    end
    a
  end


end
