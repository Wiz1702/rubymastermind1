class Game
  attr_accessor :pegs, :colors, :secret_code, :num_guesses, :game_over

  def initialize(pegs, colors)
    @pegs = pegs
    @colors = colors
    @secret_code = generate_secret_code
    @num_guesses = 0
    @game_over = false
  end

  def play_game
    puts "The secret code has been generated. Try to guess the #{@pegs} colors in the code."

    while !@game_over
      print "Enter your guess (#{@pegs} colors separated by spaces): "
      guess = gets.chomp.upcase.split(" ")

      next unless validate_guess(guess)

      @num_guesses += 1  
      result = check_guess(guess)
      exact_matches, color_matches = result
      puts "Result: #{exact_matches} exact match(es), #{color_matches} color match(es)."

      if exact_matches == @pegs
        puts "Congratulations! You guessed the secret code correctly."
        @game_over = true
      elsif @num_guesses == 10
        puts "Game over! You ran out of attempts. The secret code was #{secret_code.join}."
        @game_over = true
      else
        puts "You have #{10 - @num_guesses} attempt(s) left."
      end
    end
  end

  def validate_guess(guess)
    if guess.length != @pegs || guess.any? { |color| !@secret_code.include?(color) }
      puts "Invalid guess. Please try again."
      return false
    end
    true
  end

  def check_guess(guess)
    exact_matches = 0
    color_matches = 0

    guess.each_with_index do |color, index|
      if color == @secret_code[index]
        exact_matches += 1
      elsif @secret_code.include?(color)
        color_matches += 1
      end
    end

    [exact_matches, color_matches]
  end

  def generate_secret_code
    colors = ["R", "G", "B", "Y", "O", "P"].sample(@pegs)
    colors
  end

  def is_game_over
    @game_over
  end
end

class Player
  attr_accessor :name, :is_human

  def initialize(name, is_human)
    @name = name
    @is_human = is_human
  end

  def get_guess
    if @is_human
      gets.chomp.upcase.split(" ")
    else
      (1..4).map { ["R", "O", "Y", "G", "B", "V"].sample }
    end
  end
end

class Color
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

def main
  puts "Hello, Before you play, please enter your name: "
  name = gets.chomp
  puts "#{name},Welcome to Mastermind!, Get ready to rumble!!!"
  puts "Please enter the number of pegs (4-6): "
  pegs = gets.chomp.to_i

  puts "Please enter the number of colors (4-8): "
  colors = gets.chomp.to_i
  puts "You have selected #{pegs} pegs and #{colors}"
  puts "The colors available are:(R, O, Y, G, B, V) which represent Red, Orange, Yellow, Green, Blue, Violet respectively " 
  

  game = Game.new(pegs, colors)
  game.play_game
end

main
