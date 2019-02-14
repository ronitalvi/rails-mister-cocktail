require 'open-uri'
require 'json'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
cocktails_serialized = open(url).read
cocktails = JSON.parse(cocktails_serialized)
cocktails['drinks'].each do |cocktail|
  Ingredient.create!(name: cocktail['strIngredient1'])
end
