class CocktailsController < ApplicationController
  # before_action :find_cocktail, only: [:show, :destroy]


  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end

  def new

    @cocktail = Cocktail.new
  end

  def create

    @cocktail = Cocktail.new(params_cocktail)

    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render "new"

    end
  end

  def destroy

    @cocktail = Cocktail.find(params[:id])
    @cocktail.destroy
    redirect_to cocktails_path
  end

  private

  def find_cocktail
    @cocktail = Cocktail.find[params[:id]]
  end

  def params_cocktail
    params.require(:cocktail).permit(:name, :photo)
  end
end
