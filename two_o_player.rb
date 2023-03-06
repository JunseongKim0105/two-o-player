require'./player'

class Game
  
  def initialize(name1,name2)
    @player1 = Player.new(name1)
    @player2 = Player.new(name2)
    @score1 = 3
    @score2 = 3
    @current_player = 1
  end

  def start
    while @score1 > 0 && @score2 > 0
      num1,num2,true_answer = self.random_generator
      answer = self.ask_question(num1, num2)
      self.check_answer(answer,true_answer)
      self.switch_player
      
      puts '----- NEW RETURN -----' unless @score1 == 0 || @score2 == 0
   end
   self.print_score
 end

 private

 def random_generator
  num1 = rand(1..10)
  num2 = rand(1..10)
  true_answer = num1 + num2
  return num1, num2 , true_answer
 end

 def ask_question(num1, num2)
if @current_player == 1
  puts "#{@player2}: What does #{num1} plus #{num2} equal?"
else
  puts "#{@player1}: What does #{num1} plus #{num2} equal?" 
end
answer = gets.chomp
end
def check_answer(answer,true_answer)
  if @current_player == 1 && answer.to_i != true_answer
    @score1 -= 1
    puts "#{@player2.name}: Seriously? No!"
  elsif @current_player == 2 && answer.to_i != true_answer
    @score2 -= 1
    puts "#{@player1.name}: Seriously? No!"
  else
    puts "YES! You are correct."
  end
end

def switch_player 
  if @current_player == 1
    @current_player = 2
  else
    @current_player = 1
  end
end

def print_score
  puts "----- GAME OVER -----"
  if @score1 == 0
    puts "#{@player2.name} wins with a score of #{@score2}/3"
  else
    puts "#{@player1.name} wins with a score of #{@score1}/3"

  end
  puts 'Good bye'
end



end

game = Game.new('Jun','Michelle')
game.start