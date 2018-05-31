#!/usr/bin/env ruby

require 'ft_wikipedia/version'
require 'open-uri'
require 'nokogiri'
require 'rubygems'
require_relative 'errors'

module FtWikipedia
  def initialize
  end

  @@count_link = 0
  @@links_met = []

  def self.search_word(str)
    doc = Nokogiri::HTML(open("https://wikipedia.org/wiki/" + str))
    search_link = doc.css('.mw-parser-output').css('p').css('a[href]:not([title^=Help])')
    arr = Array.new


    if @@count_link.zero?
      puts "Ft_wikipedia.search(\"#{str.capitalize}\")"
      puts "First search @ :https://wikipedia.org/wiki/#{str.capitalize}"
    end


    if search_link.each do |a|
      if a['href'].include? "wiki"
        arr.push(a['href'])
      end
    end
    end

    if arr[0].nil?
      begin
        raise Dead_end
      rescue Exception => e
        e.check_deadend
        puts "=> nil"
        return
      end
    end

    if @@count_link.nonzero?
      if @@links_met.include? "/wiki/#{str}"
        begin
          raise Loop_detector
        rescue Exception => e
          e.check_loop
          puts "=> nil"
          return
        end
      end
    end


    @@links_met.push("/wiki/#{str}")
    if arr[0] == "/wiki/Philosophy"
      @@count_link += 1
      puts "https://wikipedia.org#{arr[0]}"
      puts "=> #{@@count_link}"
    elsif str == "Philosophy".downcase
      puts "=> #{@@count_link}"
    else
      @@count_link += 1
      puts "https://wikipedia.org#{arr[0]}"
      return FtWikipedia.search_word(arr[0].split("/")[2])
    end
  end
end


FtWikipedia.search_word('love')
