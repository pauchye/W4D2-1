module Slideable

    def horizontal_dirs 
        horz_dirs = []
        HORZ_AND_VERT_DIRS.each do |dir|
            horz_dirs += grow_unblocked_moves_in_dir(dir[0],dir[1])
        end

        horz_dirs
    end

    def diagonal_dirs 
        diag_dirs = []
        DIAGONAL_DIRS.each do |dir|
            diag_dirs += grow_unblocked_moves_in_dir(dir[0],dir[1])
        end

        diag_dirs
    end

    def moves #array of all possible positions
        if move_dirs == "horizontal"
            return horizontal_dirs 
        elsif move_dirs == "diagonal"
            return diagonal_dirs
        else
            return horizontal_dirs + diagonal_dirs
        end
    end

    private 
    def move_dirs 
    end

    def grow_unblocked_moves_in_dir(dx, dy)
        i = 1
        unblocked_moves = []
        while self.board.valid_pos?([pos[0] + dx*i, pos[1] + dy*i])
            new_x, new_y = pos[0] + dx*i, pos[1] + dy*i
            if self.board[(new_x,new_y)].empty?
                unblocked_moves << [new_x,new_y]
            else
                if self.color != self.board[(new_x,new_y)].color
                    unblocked_moves << [new_x, new_y]
                    break
                else
                    break
                end
            end
            i += 1
        end        
        
        return unblocked_moves
    end
    HORZ_AND_VERT_DIRS: [[1,0], [0,1], [0,-1], [-1,0]]

    DIAGONAL_DIRS: [[1,1], [1,-1], [-1,-1], [-1,1]]

end