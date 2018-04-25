require_relative 'Slideable'
require_relative 'piece'
require_relative 'display'

class Bishop < Piece
  include Slideable
  attr_reader :symbol

  # def initialize(color,board,pos)
  #   super(color,board,pos)
  #
  #   @move_dirs = CARTESIAN_DIRS
  # end

  def symbol
    @symbol = "♝".colorize(@color)
  end

  def move_dirs
    diagonal_moves
  end


end
