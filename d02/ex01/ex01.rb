class Html
	attr_reader :page_name
	def initialize (filename)
		@page_name = filename
		head
	end

	def head
		if (File.owned?("#{@page_name}.html"))
			raise "A file named #{@page_name}.html already exist!"
		end
		File.open("#{@page_name}.html", "w") do |file|
			file << "<!DOCTYPE html>\n<html>\n<head>\n<title>#{@page_name}</title>\n</head>\n<body>\n"
		end
	end

	def dump(str)

		File.open("#{@page_name}.html", "a+") do |file|
			file << "<p>#{str}</p>\n"
			p file
			file.each_line do |line|
				p line
				if line =~ /<body>/
					raise "There is no body tag in #{@page_name}"
				end
			end
		end
	end

	def finish
		File.open("#{@page_name}.html", "a") do |file|
			file << "</body>\n"
		end
	end
end

if $PROGRAM_NAME == __FILE__
	a = Html.new("test")
	10.times{|x| a.dump("titi_number#{x}")}
	a.finish
end
