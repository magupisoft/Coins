#Utilities extensions

# Validate if string is a valid integer valuer (negative or positive)
class String
	def is_i?
		/\A[-+]?\d+\z/ === self
	end
end

class Integer
	def is_i?
		self.to_i.integer?
	end
end