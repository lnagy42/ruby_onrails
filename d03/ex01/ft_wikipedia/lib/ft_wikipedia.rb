require 'ft_wikipedia/version'
require 'open-uri'
require 'nokogiri'
require 'rubygems'

class Loop_detector < StandardError
  def message
    "Loop detected there is no way to philosophy here"
  end
end

class Dead_end < StandardError
  def message
    "Dead end page reached"
  end
end

class Ft_wikipedia

  @@count_link = 0
  @@links_met = []

  def self.search(str)
    doc = Nokogiri::HTML(open("https://wikipedia.org/wiki/" + str))
    search_link = doc.css('.mw-parser-output').css('p').css('a[href]:not([title^=Help])')
    arr = Array.new

    if @@count_link.zero?
      puts "Ft_wikipedia.search(\"#{str.capitalize}\")"
      puts "First search @ :https://wikipedia.org/wiki/#{str.capitalize}"
    end

    search_link.each { |a| arr.push(a['href']) if a['href'].include? "wiki" }

    raise Dead_end if arr[0].nil?
    raise Loop_detector if @@count_link.nonzero? && @@links_met.include?("/wiki/#{str}")

    @@links_met.push("/wiki/#{str}")
    if arr[0] == "/wiki/Philosophy"
      @@count_link += 1
      puts "https://wikipedia.org#{arr[0]}"
      return @@count_link
    elsif str == "Philosophy".downcase
      return @@count_link
    end
    @@count_link += 1
    puts "https://wikipedia.org#{arr[0]}"
    Ft_wikipedia.search(arr[0].split("/")[2])

  rescue Exception => e
    if e.class == Loop_detector
      puts e.message
      return nil
    elsif e.message == '404 Not Found' || e.class == Dead_end
      puts "Dead end page reached"
    else
      raise e
    end
  ensure
    @@count_link = 0
    @@links_met = []
  end

end

Ft_wikipedia.search('love')
