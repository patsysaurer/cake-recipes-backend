class Cake < ApplicationRecord
    belongs_to :user
    validates :cakeName, :cakeDescription, :cakeIngredients, :cakeInstructions, :cakeServings, :cakeImage, presence: true
    validates :cakeDescription, :cakeIngredients, :cakeInstructions, length: { minimum:5 }
    validates :cakeImage, length: { minimum:10}
    validates :cakeServings, length: { minimum:1 }
end
