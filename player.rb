module Player
  @player_name = nil

  private
  #
  def get_player_name
    puts 'Enter your name.'
    name = gets.chomp
    @player_name = name
  end
  #
  def player_move(board)
    print "#{@player_name} is playing:  "
    position = gets.chomp.split(",")
    position.map! { |n| n.to_i }

    if board[position[0]][position[1]].eql?("_")
      return position
    else
      puts "----------------------------------------------------------------------------"
      puts "The move you have been entered is already taken.Please type a different one."
      puts "----------------------------------------------------------------------------"
      player_move board
    end
  end
end
