class Player

	attr_reader :name, :symbol

	#The player has a nam and a symbol is gonna play with on the board (X or O
	def initialize(name, symbol)
		@name = name
		@symbol = symbol
	end

end

class BoardCase

	attr_accessor :value

	#The BoardCase can be empty or take either (X or O)
	def initialize(value)
		@value = value
	end

end

class Board

	attr_accessor :boardcases

	def initialize
		@boardcases = [
			BoardCase.new("1"),
			BoardCase.new("2"),
			BoardCase.new("3"),
			BoardCase.new("4"),
			BoardCase.new("5"),
			BoardCase.new("6"),
			BoardCase.new("7"),
			BoardCase.new("8"),
			BoardCase.new("9")
		]

		print_case_value
	end

	def print_case_value
		puts
		puts "Voici la grille"
		puts "###############"
		puts " # " + @boardcases[0].value + " # " + @boardcases[1].value + " # " + @boardcases[2].value + " # "
		puts "###############"
		puts " # " + @boardcases[3].value + " # " + @boardcases[4].value + " # " + @boardcases[5].value + " # "
		puts "###############"
		puts " # " + @boardcases[6].value + " # " + @boardcases[7].value + " # " + @boardcases[8].value + " # "
		puts "###############"
		puts 
	end

	def change_value(choice, symbol)
		@boardcases[choice-1].value = symbol
	end

	def error_number(choice)
		choice = choice.to_s
		possiblechoices = ["1","2","3","4","5","6","7","8","9"]
		if 
			possiblechoices.include?(choice)
			false
		else
			puts "Please enter a valid boardcase!"
			true
		end
	end

	def error_letter(choice)
		if @boardcases[choice-1].value == "X" || @boardcases[choice-1].value == "O"
			puts "This board has already been chosen!"
			true
		else
			false
		end
	end

	def game_stops
		if @boardcases[0].value == @boardcases[1].value && @boardcases[1].value == @boardcases[2].value
   		true
    elsif @boardcases[3].value == @boardcases[4].value && @boardcases[4].value == @boardcases[5].value
   		true
    elsif @boardcases[6].value == @boardcases[7].value && @boardcases[7].value == @boardcases[8].value
   		true
    elsif @boardcases[0].value == @boardcases[3].value && @boardcases[3].value == @boardcases[6].value
   		true
    elsif @boardcases[1].value == @boardcases[4].value && @boardcases[4].value == @boardcases[7].value
   		true
    elsif @boardcases[2].value == @boardcases[5].value && @boardcases[5].value == @boardcases[8].value
   		true
    elsif @boardcases[2].value == @boardcases[4].value && @boardcases[4].value == @boardcases[6].value
   		true
    elsif @boardcases[0].value == @boardcases[4].value && @boardcases[4].value == @boardcases[8].value
	 		true
		end
	end

end

class Game

	attr_accessor :players, :board

	def initialize
		puts "Please enter first player's name"
		player1_name = gets.chomp
		player1 = Player.new(player1_name,"X")
		puts "Please enter second player's name"
		player2_name = gets.chomp
		player2 = Player.new(player2_name,"O")

		@players = [player1, player2]

		@board = Board.new

		launch_game
	end

	def launch_game
		9.times do |turn|
			play(turn)
			if is_over == true
				puts "Congrats #{@players[turn % 2].name}"
				play_again
			break
			end
		end
	end

	def play_again
		puts "Do you want to play again? Type yes"
		again = gets.chomp
		if again == "yes"
			Game.new
		end
	end

	def play(turn)
		i = turn % 2 
			puts "#{@players[i].name}, on what board do you want to play #{@players[i].symbol}?"
			choice = gets.chomp.to_i
			while @board.error_number(choice) == true || @board.error_letter(choice) == true
				puts "#{@players[i].name} you are not allowed to play on this boardcase !"
				puts "#{@players[i].name}, on what board do you want to play #{@players[i].symbol}?"
				choice = gets.chomp.to_i
			end
			@board.change_value(choice, @players[i].symbol)
			@board.print_case_value
	end

	def is_over
		if @board.game_stops == true 
			true
		end
	end

end

#------------------------------------#

Game.new
