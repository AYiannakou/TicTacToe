module PerfectPlayer
  
  private
  def perfect_moves
    [[1, 1], [0, 0], [0, 2], [2, 0], [1, 2], [1, 0], [0, 1], [2, 1], [2, 2]]
  end
  #
  def perfect_player_move(board)
    move = recommend_move board
    print "Computer played: #{move.to_s}\n"
    move
  end
  #
  def recommend_move(board)
    option = Array.new
    move = nil
    seek_for = "XX"
    
    #horizontal 1
    option[0] = [0, 2] if (board[0][0] + board[0][1]).to_s == seek_for
    option[1] = [0, 1] if (board[0][0] + board[0][2]).to_s == seek_for
    option[2] = [0, 0] if (board[0][1] + board[0][2]).to_s == seek_for
    
    #horizontal 2
    option[3] = [1, 2] if (board[1][0] + board[1][1]).to_s == seek_for
    option[4] = [1, 1] if (board[1][0] + board[1][2]).to_s == seek_for
    option[5] = [1, 0] if (board[1][1] + board[1][2]).to_s == seek_for

    #horizontal 3
    option[6] = [2, 2] if (board[2][0] + board[2][1]).to_s == seek_for
    option[7] = [2, 1] if (board[2][0] + board[2][2]).to_s == seek_for
    option[8] = [2, 0] if (board[2][1] + board[2][2]).to_s == seek_for

    #vertical 1
    option[9]  = [2, 0] if (board[0][0] + board[1][0]).to_s == seek_for
    option[10] = [1, 0] if (board[0][0] + board[2][0]).to_s == seek_for
    option[11] = [0, 0] if (board[2][0] + board[1][0]).to_s == seek_for
    
    #vertical 2
    option[12] = [2, 1] if (board[0][1] + board[1][1]).to_s == seek_for
    option[13] = [1, 1] if (board[0][1] + board[2][1]).to_s == seek_for
    option[14] = [0, 1] if (board[2][1] + board[1][1]).to_s == seek_for
    
    #vertical 3
    option[15] = [2, 2] if (board[0][2] + board[1][2]).to_s == seek_for
    option[16] = [1, 2] if (board[0][2] + board[2][2]).to_s == seek_for
    option[17] = [0, 2] if (board[2][2] + board[1][2]).to_s == seek_for
    
    moves = option.select { |element| element }

    move = moves.find { |element| element if board[element[0]][element[1]].eql?("_") }

    if move.nil?
      move = perfect_moves.find { |element| element if board[element[0]][element[1]].eql?("_") }
    end
    move
  end
end
