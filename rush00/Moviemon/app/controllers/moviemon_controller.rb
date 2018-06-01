$view ||= 'shutdownscreen'
# $selected
# $game
$player ||= {
strengh: 5,
position: [0, 0],
life: 20,
moviedex: [],
index: 0
}

class MoviemonController < ApplicationController
  def titlescreen
  end
  def worldmap
    @map = Array.new(10) { Array.new(10) }
    if $view == 'titlescreen'
      $view = 'worldmap'
    end
  end
  def moviedex
  end



  def power
    if $view == 'shutdownscreen'
      $view = 'titlescreen'
      redirect_to :"#{$view}"
    end
  end
  def start
    puts "[[[#{$view}]]]"
    case $view
      when "titlescreen"
        $view = 'worldmap'
        redirect_to :"#{$view}"
      when "worldmap"
        $view = "moviedex"
        redirect_to :"#{$view}"
      else
        redirect_to :"#{$view}"
    end
  end
end

# class Moviemon
#   strengh = 40
#   director =
# end

