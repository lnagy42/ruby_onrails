#!/usr/bin/env ruby

class Loop_detector < StandardError
  def check_loop
    puts "Loop detected there is no way to philosphy here"
  end
end

class Dead_end < StandardError
  def check_deadend
    puts "Dead end page reached"
  end
end