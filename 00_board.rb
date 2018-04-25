require 'byebug'
require_relative 'piece'
require_relative 'NullPiece'
require_relative 'display'
require_relative 'rook'
require_relative 'knight'
require_relative 'bishop'
require_relative 'king'
require_relative 'queen'
require_relative 'pawn'


class Board
  attr_accessor :grid, :null_piece


  def initialize
    @null_piece = NullPiece.instance
    @grid = Array.new(8) { Array.new(8, @null_piece) }

    self.populate
  end

  def move_piece(start_pos,end_pos)
    if valid_pos?(start_pos) && valid_pos?(end_pos) && valid_move?(start_pos, end_pos)
      self[end_pos] = self[start_pos]
      self[start_pos] = @null_piece
    end
  end

  def populate
    # @null_piece = NullPiece.instance


    # debugger
    self[[0,0]] = Rook.new(:blue,self,[0,0])
    self[[0,7]] = Rook.new(:blue,self,[0,7])
    self[[7,0]] = Rook.new(:red,self,[7,0])
    self[[7,7]] = Rook.new(:red,self,[7,7])

    self[[0,1]] = Knight.new(:blue,self,[0,1])
    self[[0,6]] = Knight.new(:blue,self,[0,6])
    self[[7,1]] = Knight.new(:red,self,[7,1])
    self[[7,6]] = Knight.new(:red,self,[7,6])

    self[[0,2]] = Bishop.new(:blue,self,[0,2])
    self[[0,5]] = Bishop.new(:blue,self,[0,5])
    self[[7,2]] = Bishop.new(:red,self,[7,2])
    self[[7,5]] = Bishop.new(:red,self,[7,5])

    self[[0,3]] = King.new(:blue,self,[0,3])
    self[[7,4]] = King.new(:red,self,[7,4])
    self[[0,4]] = Queen.new(:blue,self,[0,4])
    self[[7,3]] = Queen.new(:blue,self,[7,3])

    @grid.map!.with_index do |row,x|
      # if [2,3,4,5].include?(x)
      #   # row.map! { |col| col = @null_piece}
      if [1].include?(x)
        row.each_with_index {|col,y| col = Pawn.new(:blue,self,[x,y]) }
      elsif [6].include?(x)
        row.each_with_index {|col,y| col = Pawn.new(:red,self,[x,y]) }
      end
    end

    @grid
  end

  def [](pos)
    x,y = pos
    @grid[x][y]
  end

  def []=(pos,val)
    x,y = pos
    @grid[x][y] = val
  end

  def valid_pos?(pos)
    raise "Not a valid position" unless pos.all? { |i| i.between?(0,7) }
    true
  end

  def valid_move?(start_pos, end_pos)
    raise "No piece at starting position" if self[start_pos].is_a?(NullPiece)
    raise "Can't move to there" unless self[end_pos].is_a?(NullPiece)
    true
  end

  def add_piece(piece,pos)
    self[pos] = piece
  end

  def checkmate?(color)
  end

  def in_check?(color)
  end

  def find_king(color)
  end

  def pieces
  end

  def dup
  end

  def move_piece!
  end

  def inspect
    "Your move!"
  end

 #  def render
 #    rows = ["0 | ", "1 | ", "2 | ", "3 | ", "4 | ", "5 | ", "6 | ", "7 | "]
 #    @grid.each_with_index do |row, i|
 #      row.each do |el|
 #        a = el.is_a?(NullPiece) ? " " : el.symbol
 #       rows[i] << "#{a} | "
 #     end
 #   end
 #
 #
 #   puts "    0   1   2   3   4   5   6   7"
 #   puts  "  ---------------------------------"
 #   rows.each do |row|
 #     puts row
 #     puts  "  ---------------------------------"
 #   end
 # end

end
