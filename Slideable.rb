module Slideable
  CARTESIAN_DIRS = [[0, 1], [0, -1], [1, 0], [-1, 0]]
  DIAGONAL_DIRS = [[1, 1], [1, -1], [-1, 1], [-1, -1]]

  def cartesian_moves
    CARTESIAN_DIRS
  end

  def diagonal_moves
    DIAGONAL_DIRS
  end

  def moves
    CARTESIAN_DIRS + DIAGONAL_DIRS
  end

  def possible_end_pos(start_pos,move_set)
    res = []

    move_set.each do |move|
      x = start_pos[0]
      y = start_pos[1]

      until x > 7 || x < 0 || y > 7 || y < 0
        x += move[0]
        y += move[1]
        res << [x,y]

      end
      res = res[0..-2]
    end
    res
  end
end
