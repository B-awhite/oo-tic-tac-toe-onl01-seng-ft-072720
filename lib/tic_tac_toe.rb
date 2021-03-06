class TicTacToe
  
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]
  
  def initialize
    @board = [" "," "," "," "," "," "," "," "," "]
  end 
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(user_input)
    user_input.to_i - 1       
  end
  
  def move(index, token)
    @board[index] = token 
  end
  
  def position_taken?(index)
    @board[index] != " "
  end 
  
  def valid_move?(index)
    index.between?(0, 8) && !position_taken?(index)
  end 
  
  def turn_count
    @board.count{|square| square != " " }
  end
  
  def current_player
    num_turns = turn_count
   if num_turns % 2 == 0
     player = "X"
   else
    player = "O"
   end
   return player
  end
  
  def turn 
    user_input = gets.chomp
    index = input_to_index(user_input)
   if valid_move?(index)
     player_token = current_player
     move(index, player_token)
     display_board
   else
    turn 
   end 
  end 
  
  def won? 
    WIN_COMBINATIONS.detect do |combo|
      @board[combo[0]] == @board[combo[1]] &&
      @board[combo[1]] == @board[combo[2]] &&
      position_taken?(combo[0])
    end
  end
  
  def full?
     @board.all? {|index| index == "X" || index == "O"}
  end 
  
  def draw?
    !won? && full?
  end 
  
  def over?
    won? || full? || draw?
  end 
  
  def winner 
    won = ""
    if winner = won?
      won = @board[winner.first]
    end
  end
  
  def play
   until over? 
    turn
  end
   if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cat's Game!"
  end
end
  
end 