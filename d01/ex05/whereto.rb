def whereto

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
 	argv = ARGV[0].split(",")
	if ARGV.length > 10 || ARGV.length == 0
		exit
	end  
	
	argv.each do |str|
	str = str.strip.capitalize
	if str == states.key(states.fetch(str, true))
		puts "#{capitals_cities.fetch(states.fetch(str))} is the capital of #{states.key(states.fetch(str))} (akr: #{states.fetch(str)})"
	elsif capitals_cities.has_value?(str) == true
		puts "#{str} is the capital of #{states.key(capitals_cities.key(str))} (akr: #{capitals_cities.key(str)})"
	elsif str == ""
	else
		puts "#{str} is neither a capital nor a state"
	end
	end
end
whereto
