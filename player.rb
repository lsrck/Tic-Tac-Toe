class Player

	attr_reader :name, :symbol

	#The player has a nam and a symbol is gonna play with on the board (X or O
	def initialize(name, symbol)
		@name = name
		@symbol = symbol
	end

end
