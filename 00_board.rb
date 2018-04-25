require 'byebug'
require_relative '01_display'
require_relative 'p1_null'
require_relative 'p2_pawn'
require_relative 'p3_rook'
require_relative 'p4_knight'
require_relative 'p5_bishop'
require_relative 'p6_queen'
require_relative 'p7_king'


class Board
  attr_reader :null_piece
  attr_accessor :grid

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
    @grid.each_with_index do |row, row_i|
      if [1, 6].include?(row_i)
        color = row_i == 1 ? :blue : :red
        row.map!.with_index { |col, col_i| Pawn.new(color, [row_i, col_i])}
      end
    end

    self[[0,0]] = Rook.new(:blue,[0,0])
    self[[0,7]] = Rook.new(:blue,[0,7])
    self[[7,0]] = Rook.new(:red,[7,0])
    self[[7,7]] = Rook.new(:red,[7,7])

    self[[0,1]] = Knight.new(:blue,[0,1])
    self[[0,6]] = Knight.new(:blue,[0,6])
    self[[7,1]] = Knight.new(:red,[7,1])
    self[[7,6]] = Knight.new(:red,[7,6])

    self[[0,2]] = Bishop.new(:blue,[0,2])
    self[[0,5]] = Bishop.new(:blue,[0,5])
    self[[7,2]] = Bishop.new(:red,[7,2])
    self[[7,5]] = Bishop.new(:red,[7,5])

    self[[0,3]] = King.new(:blue,[0,3])
    self[[7,4]] = King.new(:red,[7,4])
    self[[0,4]] = Queen.new(:blue,[0,4])
    self[[7,3]] = Queen.new(:red,[7,3])

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
end
