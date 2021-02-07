class FilmesController < ApplicationController
  
  before_action :set_filme, only: [:edit, :update, :destroy]
  
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

  def destroy
    @filme.destroy
    redirect_to root_url
  end

  def edit
    render :edit
  end

  def update
    if @filme.update filmes_params
      flash[:notice] = "Filme atualizado com sucesso!"
      redirect_to root_url
    else
     render :edit
    end
  end
  
  def set_filme
    @filme = Filme.find(params[:id])
  end

  private

  def filmes_params
    params.require(:filme).permit(:nome, :descricao)
  end

end
