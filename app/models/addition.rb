class Addition
	attr_accessor :sum, :num1, :num2
	def initialize(a,b)
		@num1 = a
		@num2 = b
		@sum = @num1 + @num2
	end

end