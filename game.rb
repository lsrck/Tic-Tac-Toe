require_relative "board"
require_relative "boardcase"
require_relative "player"

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
