#!/usr/bin/env ruby

class Html
	attr_reader :page_name
	def initialize (html)
		@page_name = html
		head
	end

	def head
		File.open("#{@page_name}.html", "w") do |file|
			file << "<!DOCTYPE html>\n<html>\n<head>\n<title>#{@page_name}</title>\n</head>\n<body>\n"
		end
	end

	def dump(str)
		File.open("#{@page_name}.html", "a") do |file|
			file << "<p>#{str}</p>\n"
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
