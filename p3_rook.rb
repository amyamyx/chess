require_relative 'm0_slideable'
require_relative 'p0_piece'

class Rook < Piece
  include Slideable
  attr_reader :symbol

  def symbol
    @symbol = "♖".colorize(@color)
  end

  def move_dirs
    cartesian_moves
  end


end
