class SeriesController < ApplicationController
  def index
    @series = Serie.populares
    @poster =  'http://image.tmdb.org/t/p/w185/'
  end
end