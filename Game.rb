class Game
  attr_accessor :start
  
  def initialize(player1, player2)
    @players = [player1, player2]
    @current_player = @players.first
  end

  def generate_question
    num1 = rand(1..20)
    num2 = rand(1..20)
    Question.new(num1, num2)
  end

  def start
    loop do
      question = generate_question
      puts "#{@current_player.name}, what does #{question.num1} plus #{question.num2} equal?"

      answer = gets.chomp

      if question.correct?(answer)
        puts "you are correct!"
      else
        @current_player.life -= 1
        puts "incorrect, you have #{@current_player.life} life points left"
      end

      if @current_player.life == 0
        puts "#{@current_player.name} has lost"
      break
      end

      @current_player = @players.rotate!.first
    end

    puts "Game Over"
  end
end

