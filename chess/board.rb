require_relative "piece"

class Board

    attr_accessor :board

    def initialize

        @board = Array.new(8){Array.new(8,nil)}
        @board.each_with_index do |row,i| 
            if [0,1,6,7].include?(i)
                row.map!{|ele| ele = Piece.new}
            end
        end

    end

    def [](position)
        board[position[0]][position[1]]
    end

    def []=(position,value)
        board[position[0]][position[1]] = value
    end

    def move_piece(start_pos,end_pos)
       if board[start_pos]

    end



end