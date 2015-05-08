#Utilities extensions

# Validate if string is a valid integer valuer (negative or positive)
class String
	def is_i?
		/\A[-+]?\d+\z/ === self
	end
end