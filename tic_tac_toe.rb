load 'player.rb'
load 'perfect_player.rb'

class TicTacToe
  include Player
  include PerfectPlayer
  #
  def initialize(computer_name)
    @board = [["_","_","_"],["_","_","_"],["_","_","_"]]
    @players = Hash.new

    introduction

    ok = gets.chomp
    if ok.downcase.eql?("ok")
      player_name = get_player_name

      @players[player_name] = "X"
      @players[computer_name] = "O"

      start_game
    else
      puts "Restart the game"
    end
  end
  #
  private
  def introduction
    puts "We assuming that you know how to play Tic Toc Toe game."
    puts "To select where to add your mark on the board,"
    puts "enter the number column and position number "
    puts "with a comma between them."
    puts " "
    puts "Ready to play, type 'ok' and press enter to play"
  end
  #
  def display_board
    puts "--------------------------".center(60)
    puts @board[0].to_s.center(60)
    puts @board[1].to_s.center(60)
    puts @board[2].to_s.center(60)
    puts "--------------------------".center(60)
  end
  #
  def result(player,boolean)
     if boolean == true
      puts "Congratulations #{@players.keys[player]}, you won!"
    else
      puts "Even game, try again!"
    end
  end
  #
  def winning_rules(player_index)
    game_to_finish = false
    rule = Array.new
    user_sign = @players.values[player_index] * 3

    rule[0] = (@board[0][0] + @board[1][0] + @board[2][0]).to_s
    rule[1] = (@board[0][1] + @board[1][1] + @board[2][1]).to_s
    rule[2] = (@board[0][2] + @board[1][2] + @board[2][2]).to_s
    rule[3] = (@board[0][0] + @board[1][1] + @board[2][2]).to_s
    rule[4] = (@board[0][2] + @board[1][1] + @board[2][0]).to_s
    rule[5] = (@board[0][0] + @board[0][1] + @board[0][2]).to_s
    rule[6] = (@board[1][0] + @board[1][1] + @board[1][2]).to_s
    rule[7] = (@board[2][0] + @board[2][1] + @board[2][2]).to_s

    game_to_finish = rule.select { |item| return true if item == user_sign }

    game_to_finish
  end
  #
  def insert_move(player_index, position)
    @board[position[0]][position[1]] = @players.values[player_index]
  end
  #
  def start_game
    player_index = 0
    winner = false

    1.upto(9) do
      if player_index.odd?
        move = perfect_player_move @board
        insert_move(player_index, move)
      else
        position = player_move @board
        insert_move(player_index, position)
      end
      winner = winning_rules(player_index)
      display_board
      break if winner == true
      player_index = player_index % 2 == 0 ? 1 : 0
    end
    result(player_index,winner)
  end
end
