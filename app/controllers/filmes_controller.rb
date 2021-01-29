class FilmesController < ApplicationController
  def index
    @filmes = Filme.all
  end

  def new
    @filme = Filme.new
  end

  def create
    @filme = Filme.new filmes_params
    if @filme.save
      flash[:notice] = "Filme salvo com sucesso!"
      redirect_to root_url
    else
      renderiza :new
    end 
  end

  def filmes_params
    params.require(:filme).permit(:nome, :descricao)
  end

  def destroy
    nome = params[:nome]
    Filme.destroy nome
    redirect_to root_url
  end

end
