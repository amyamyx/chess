module Stepable




  def possible_end_pos(start_pos,move_set)
    res = []

    move_set.each do |move|
        x,y = start_pos
        x += move[0]
        y += move[1]
        res << [x,y] if x.between?(0,7) && y.between?(0,7)
      end
    res
  end

end
