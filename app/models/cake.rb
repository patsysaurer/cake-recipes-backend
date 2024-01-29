class Cake < ApplicationRecord
    belongs_to :user
    validates :cakeName, :cakeDescription, :cakeIngredients, :cakeInstructions, :cakeServings, :cakeImage, presence: true
    validates :cakeDescription, :cakeImage, length: { minimum:10 }
    validates :cakeIngredients, :cakeInstructions, length: { minimum:15 }
    validates :cakeServings, length: { minimum:1 }
end
