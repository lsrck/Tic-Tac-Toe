class BoardCase

	attr_accessor :value

	#The BoardCase can be empty or take either (X or O)
	def initialize(value)
		@value = value
	end

end
