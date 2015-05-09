# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "coins/version"

Gem::Specification.new do |s|
  s.name        = "coins"
  s.version     = Coins::VERSION
  s.authors     = ["Manuel Gutiérrez Pineda"]
  s.email       = ["lp.gutierrezpineda@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{A Bytelandian Gold Coin changer to Dollars}
  s.description = %q{It takes a bytelandian Gold coin of any 
									denomination and convert it to American dollars USD}

  s.rubyforge_project = "coins"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = ["coins"]
  s.require_paths = ["lib"]

  s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
