#!/usr/bin/env ruby

def coffee 
   data = [
	 ['Frank', 33],
	 ['Stacy', 15],
	 ['Juan' , 24],
	 ['Dom'  , 32],
	 ['Steve', 24],
	 ['Jill' , 24]
 ]

   data = data.sort!.sort_by {|key, value| value}.to_h
   puts data.keys
   
end

coffee
