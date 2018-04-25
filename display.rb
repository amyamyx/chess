require 'colorize'
require_relative 'board'
require_relative 'cursor'
require 'colorize'
require_relative 'piece'
require_relative 'NullPiece'
require_relative 'display'
require_relative 'rook'
require_relative 'knight'
require_relative 'bishop'
require_relative 'king'
require_relative 'queen'
require_relative 'pawn'

class Display

  attr_accessor :board, :cursor

  def initialize(board = Board.new)
    @board = board
    @cursor = Cursor.new([0,0], @board)
  end



  def render
    rows = ["0 | ", "1 | ", "2 | ", "3 | ", "4 | ", "5 | ", "6 | ", "7 | "]
    @board.grid.each_with_index do |row, i|
      row.each_with_index do |el, j|
        if [i, j] == @cursor.cursor_pos
          a = el.is_a?(NullPiece) ? " " : el.symbol
          a = a.colorize( :background => :green)
        else
          a = el.is_a?(NullPiece) ? " " : el.symbol
        end
        rows[i] << "#{a} | "
      end
    end
    puts "    0   1   2   3   4   5   6   7"
    puts  "  ---------------------------------"
    rows.each do |row|
      puts row
      puts  "  ---------------------------------"
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  c = Display.new
  c.render
  while true
    c.cursor.get_input
    system("clear")
    c.render
  end
  # c.render
  # c.board.move_piece([0,0],[2,0])
  # c.render

end
