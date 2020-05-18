class Ingredient 
    @@all = []

    def initialize(ingredient)
        @ingredient = ingredient
        @@all << self 
    end 

    def self.all 
        @@all 
    end 

    def self.most_common_allergen
        user_allergy = {}
        Allergy.all.each do |allergy|
            if user_allergy.has_key?(allergy.ingredient)
                user_allergy[allergy.ingredient] += 1 
            else 
                user_allergy[allergy.ingredient] = 1
            end 
        end 
        user_allergy.max_by {|key, val| val }.first
    end 

end 
