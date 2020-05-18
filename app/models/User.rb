require 'pry'
class User 

    @@all = []

    def initialize(name)  #I personally added name.  Is it needed? 
        @name = name 
        @@all << self 
    end 

    def self.all 
        @@all 
    end 

    #helper method to return recipe cards for this user
    def recipe_cards 
        RecipeCard.all.select{|card| card.user == self}
    end 

    def recipes 
        self.recipe_cards.map{|card| card.recipe}
    end 

    def add_recipe_card(recipe, date, rating)
        RecipeCard.new(self, recipe, date, rating)
    end   

    def declare_allergy(ingredient)
        Allergy.new(self, ingredient)
    end 

    def allergens 
        Allergy.all.map {|allergy| 
            if allergy.user == self 
                  allergy.ingredient
            end 
        }.compact 

    end 

    def top_three_recipes 
        self.recipe_cards.sort_by{|recipe| recipe.rating}.last(3)

    end 

    def most_recent_recipe 
        self.recipes.last
    end 


    ############## Bonus #######################
    #helper method that returns false if ingredients paramter is part of the allergens  
    def allergic_to_ingredients(ingredients)
        allergic_ingredients = self.allergens #ingredinets the user is allergic to
        x = 0 
        while x < allergic_ingredients.length 
            if !ingredients.include?(allergic_ingredients[x])
                return true 
            end 
            x += 1
        end 
        return false
    end 


    def safe_recipes 
        Recipe.all.select do |recipe|
            allergic_to_ingredients(recipe.ingredients) #evaluates to false if allergic to any recipe ingredient
        end 
    end 

end 