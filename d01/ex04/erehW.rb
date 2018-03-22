def erehw
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

	input_array = ARGV
	if ARGV.length > 1 || ARGV.length == 0
		exit
	end
	if capitals_cities.has_value?(ARGV[0]) == true
		puts states.key(capitals_cities.key(ARGV[0]))
	else
		puts "Unknown capital city"
	end
end

erehw

