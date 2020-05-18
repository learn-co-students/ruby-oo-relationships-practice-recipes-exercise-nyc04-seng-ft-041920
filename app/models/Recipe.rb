require 'pry'

class Recipe 

    @@all = []
    attr_reader :ingredients

    def initialize(ingredients) 
        @ingredients = ingredients  
        @@all << self 
    end 


    def self.all 
        @@all 
    end 

    def self.most_popular
        recipes = {}
        RecipeCard.all.each{|card| recipes.has_key?(card.recipe)? recipes[card.recipe] += 1 : recipes[card.recipe] = 1}
        recipes.max_by{|recipe, val| val}.first 
    end 

    def users 
        RecipeCard.all.map{|card| card.recipe == self ? card.user : nil}.compact 
    end 

    def add_ingredients(ingredient_array)
        self.ingredients.concat(ingredient_array)
    end 

    def allergens
        allergens_array = Allergy.all.map{|allergy| allergy.ingredient}
        self.ingredients.select{ |ingredient|   ##couldn't call self.all from here
            allergens_array.include?(ingredient)
        }
    end 
    
end 