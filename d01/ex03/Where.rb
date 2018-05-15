#!/usr/bin/env ruby

def where_am_i
	
	states = {
		"Oregon"     => "OR",
		"Alabama"    => "AL",
		"New Jersey" => "NJ",
		"Colorado"   => "CO"
	}
	capitals_cities = {
		  "OR" => "Salem",
		  "AL" => "Montgomery",
		  "NJ" => "Trenton",
		  "CO" => "Denver"
	}

	if ARGV.length > 1 || ARGV.length == 0
		exit
	end
	if ARGV[0] == states.key(states.fetch(ARGV[0], true))
		puts capitals_cities.fetch(states.fetch(ARGV[0]))
	else
		puts "Unknown state"
	end
end

where_am_i
