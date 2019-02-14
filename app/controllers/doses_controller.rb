
class DosesController < ApplicationController

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new

    @ingredients = Ingredient.all
  end

  def create

    @dose = Dose.new(params_dose)

    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail

   # @dose.ingredient = Ingredient.find(params[:dose][:ingredient_id])
    if @dose.save
      redirect_to cocktail_path(@dose.cocktail_id)
    else
      render :new
    end
  end

  def destroy
    #  @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail_id)
  end

  private

  def find_dose
    @dose = Dose.find(params[:id])
  end

  def params_dose
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
