module Stepable 
    
    def moves
        x, y = pos
        possible_pos = move_diffs.map { |dif| [dif[0]+x, dif[1]+y] }
        possible_pos.select { |position| self.board.valid_pos?(position) && self.color != self.board[position].color }

    end

    def move_diffs 
    end
end