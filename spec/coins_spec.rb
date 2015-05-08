require 'spec_helper'
require 'coins'
require "utils/extensions"

describe "Coins" do
	
	before(:each) do
		ARGV.clear  
		@convert_coins = Coins::Converter.new
	end
	
	context 'SUCCESS' do	
	  it "should have a converter to_usd method"  do
			@convert_coins.should respond_to(:to_usd)
	  end
	
		it "should accept a given denomination to be converted as valid integer argument"  do
			lambda do
				@convert_coins.to_usd(ARGV << (108..125))
			end.should_not raise_error SystemExit
		end
	
		it "should convert 1,000,000,00 golden coins into 4,243,218,150 USD dollars" do
			@convert_coins.to_usd(ARGV << '1000000000').include?(4243218150).should be_true
		end
		
		it "should convert 42 golden coins into 46 USD dollars" do
			@convert_coins.to_usd(ARGV << '42').include?(46).should be_true
		end
		
		it "should convert 123 golden coins into 144 USD dollars" do
			@convert_coins.to_usd(ARGV << '123').include?(144).should be_true
		end
		
		it "should convert 555555 golden coins into 1298380 USD dollars" do
			@convert_coins.to_usd(ARGV << '555555').include?(1298380).should be_true
		end
		
		it "should convert 12 golden coins into 13 USD dollars" do
			@convert_coins.to_usd(ARGV << '12').include?(13).should be_true
		end
	
		it "should convert 2 golden coins into 2 USD dollars"  do
			@convert_coins.to_usd(ARGV << '2').include?(2).should be_true
		end
	
		it "should convert 1 golden coins into 1 USD dollars"  do
			@convert_coins.to_usd(ARGV << '1').include?(1).should be_true
		end
	
		it "should convert 0 golden coins into 0 USD dollars"  do
			@convert_coins.to_usd(ARGV << '0').include?(0).should be_true
		end
		
		
		it "should include just valid integer denominations"  do
		  argv = %w(0 1 2 QWERTY)
			@convert_coins.to_usd(argv).all? { |i| (0..2).include?(i) }
		end
		
		it "shoud validate correctly string to Integer convertions"  do
		  "2".is_i?.should be_true
		  "-1".is_i?.should be_true
		  "5555".is_i?.should be_true
			"QUERYTY".is_i?.should be_false
			"4DFE34".is_i?.should be_false
		end
	end	
	
	context 'FAILURE' do
	
	  it "should not accept an string denomination coin is different thant a valid integer"  do
			argv = "UNO"
			lambda {
				   @convert_coins.to_usd(ARGV << argv)
			}.should raise_error SystemExit
	  end
		
		it "should fail if denomination coin is less than 0 and greater than 1,000,000,000"  do
			argv = %w(-1 1000000001)
			lambda {
				   @convert_coins.to_usd(argv)
			}.should raise_error SystemExit
		end
		
		it "should not include non integers denominations values"  do
		  argv = %w(0 1 2 QWERTY)
			@convert_coins.to_usd(argv).include?('QWERTY').should be_false
		end
	end
	
end