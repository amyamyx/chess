require 'colorize'
require_relative '00_board'
require_relative '02_cursor'

class Display

  attr_accessor :board
  attr_reader :cursor

  def initialize(board = Board.new)
    @board = board
    @cursor = Cursor.new([0,0], @board)
  end

  def render
    rows = ["0 |", "1 |", "2 |", "3 |", "4 |", "5 |", "6 |", "7 |"]
    @board.grid.each_with_index do |row, i|
      row.each_with_index do |el, j|
        a = el.is_a?(NullPiece) ? "   " : " #{el.symbol} "

        if [i, j] == @cursor.cursor_pos
          a = a.colorize( :background => :green )
        end

        rows[i] << "#{a}|"
      end
    end

    puts "    0   1   2   3   4   5   6   7"
    puts  "  ---------------------------------"
    rows.each do |row|
      puts row
      puts  "  ---------------------------------"
    end

    self
  end

end

if __FILE__ == $PROGRAM_NAME
  c = Display.new
  system("clear")
  c.render
  while true
    c.cursor.get_input
    system("clear")
    c.render
  end
end
