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