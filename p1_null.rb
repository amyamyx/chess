require_relative 'piece'
require 'singleton'

class NullPiece < Piece
  include Singleton

  attr_accessor :color,:board,:pos,:symbol

  def initialize
    super(color,board,pos)
    @symbol = nil
  end
end
