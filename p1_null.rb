require_relative 'p0_piece'
require 'singleton'

class NullPiece < Piece
  include Singleton
  attr_reader :symbol

  def initialize
    @symbol = " "
  end
end
