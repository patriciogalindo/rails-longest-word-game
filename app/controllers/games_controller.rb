require "open-uri"

class GamesController < ApplicationController
  before_action :wordCheck
  def new
    @letters = (('a'..'z').to_a).sample(10)
  end

  def score
    if (params[:word].split("") - params[:grid].split(" ")).any? == true
      @score = "you need to use grid"
    elsif @wordparse["found"] = true
      @score = "Congratulations!"
    else
      @score = "this word dont exist in dictionary"
  end
end
end

def wordCheck
  url = "https://wagon-dictionary.herokuapp.com/#{params[:word]}"
 @wordparse = JSON.parse(open(url).read)
end
