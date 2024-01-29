class Cake < ApplicationRecord
    belongs_to :user
    validates :cakeName, :cakeDescription, :cakeIngredients, :cakeInstructions, :cakeServings, :cakeImage, presence: true
end
