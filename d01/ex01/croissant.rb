def my_tab
	arr = []
	File.open("numbers.txt").each do |line|
	line.slice!(",")
	line.slice!("\n")
	line.to_i
	arr << line.to_i
	end
	arr = arr.sort!
	puts arr
end

my_tab

