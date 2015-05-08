#!/usr/bin/env ruby
$LOAD_PATH.unshift("#{File.dirname(__FILE__)}/../lib")
require 'coins'

unless ARGV.size > 0
		puts	"Program was expecting at least 1 denomination argument input." 
		exit 0
end

convert_coins = Coins::Converter.new
convert_coins.to_usd(ARGV)