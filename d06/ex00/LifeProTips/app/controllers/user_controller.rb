require 'nokogiri'
require 'open-uri'

class UserController < ApplicationController
  def new
    url = "https://www.randomlists.com/random-animals"
    doc = Nokogiri::HTML(open(url))
    name = doc.css('li').first.css('span').text
    cookies[:animal] = { value: animal, expires: 1.minute.from_now }

  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end

end
