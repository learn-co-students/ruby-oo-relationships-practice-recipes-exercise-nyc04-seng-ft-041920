require_relative '../config/environment.rb'

    #ingredient instances
    onion = Ingredient.new("onion")
    butter = Ingredient.new("butter")
    pepper = Ingredient.new("pepper")
    salt = Ingredient.new("salt")
    sugar = Ingredient.new("sugar")
    tomatoes = Ingredient.new("tomatoes")
    chocolate = Ingredient.new("chocolate")
    #user instances 
    bashir = User.new("Bashir")
    jack = User.new("Jack")
    rei = User.new("rei")
    #recipe instances 
    rcp1 = Recipe.new([onion, butter, salt])
    rcp2 = Recipe.new([sugar, pepper])
    rcp3 = Recipe.new([onion, sugar, pepper, salt])
    rcp4 = Recipe.new([tomatoes, chocolate]) 
    #RecipeIngredient instances (connect ingredient with recipe)
    RecipeIngredient.new(onion, rcp1)
    RecipeIngredient.new(onion, rcp3)
    RecipeIngredient.new(butter, rcp1)
    RecipeIngredient.new(salt, rcp1)
    RecipeIngredient.new(sugar, rcp2)
    RecipeIngredient.new(sugar, rcp3)
    RecipeIngredient.new(pepper, rcp2)
    RecipeIngredient.new(pepper, rcp3)

    #recipe_card instance (connects user with recipe)
    recipe_card1 = RecipeCard.new(bashir, rcp1, "2020-01-01", 4)
    recipe_card2 = RecipeCard.new(bashir, rcp3, "2020-02-02", 2)
    recipe_card3 = RecipeCard.new(rei, rcp2, "2020-05-05", 5)
    recipe_card4 = RecipeCard.new(rei, rcp3, "2020-03-01", 5)
    recipe_card5 = RecipeCard.new(bashir, rcp2, "2020-01-01", 5)
    recipe_card6 = RecipeCard.new(bashir, rcp4, "2020-01-01", 5)

    #allergy instances 
    pepper_allergy = Allergy.new(bashir, pepper)
    salt_allergy = Allergy.new(rei, salt)

binding.pry
