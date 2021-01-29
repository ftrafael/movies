class FilmesExternosController < ApplicationController
  def index
    @filme_externo = FilmeExterno.em_cartaz
    @poster =  'http://image.tmdb.org/t/p/w185/'
  end
end
