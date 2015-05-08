require "coins/version"
require "utils/extensions"

module Coins
	
	MIN_VALUE = 0
	MAX_VALUE = 1000000000
	
  class Converter
		
		def to_usd(denominations)	
			
			valid_coins = []
			converted_coins = []
			
			if denominations.kind_of?(Array)
				valid_coins = sanatize(denominations).map{ |d| Integer(d) } 
			else
				valid_coins << denominations.to_i
			end
			
			if valid_coins.any?
				puts "Input: (valid coins)" , valid_coins
				
				initialize_cache
				valid_coins.each do |coin|
					converted_coins << convert(coin)
				end
				
			else
				puts "Invalid arguments #{denominations.inspect}, try again with correct values:"
				puts "\tIt should be a valid integer between: 0 <= n <= 1,000,0000,000"
				exit 0
			end

			puts "Output:", converted_coins
			
			return converted_coins
			
		end
				
		private
			def sanatize(denominations)
				denominations.delete_if do |d|
					 not(d.is_i? && valid_denomination?(Integer(d)))
				end
			end
		
			def valid_denomination?(denomination)
				denomination.between?(Coins::MIN_VALUE, Coins::MAX_VALUE)
			end

			def initialize_cache
				@cache = Hash.new
				@cache[0] = 0
				@cache[1] = 1
				@cache[2] = 2
			end
			
			def convert(coin)
				if @cache.has_key? coin
					return @cache[coin]
				end
				
				c = convert(coin/2) + convert(coin/3) + convert(coin/4)
				@cache[coin] ||= [c, coin].max
				
				return	@cache[coin]
			end
	end
end
