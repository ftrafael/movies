class PessoasController < ApplicationController
  def index
    @pessoas = Pessoa.populares
  end
end
