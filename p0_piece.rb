require 'colorize'

class Piece
  attr_accessor :color,:pos,:symbol

  def initialize(color,pos)
    @color = color
    # @board = board
    @pos = pos
    @symbol = "♖".colorize(@color)
  end

  def symbol
    @symbol
  end

  def moves
    @moves
  end
end
