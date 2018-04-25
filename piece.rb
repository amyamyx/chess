require 'colorize'

class Piece
  attr_accessor :color,:board,:pos,:symbol

  def initialize(color,board,pos)
    @color = color
    @board = board
    @pos = pos
    @symbol = "♕".colorize(@color)
  end

  def symbol
    @symbol
  end

  def moves
    @moves
  end
end
