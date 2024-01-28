class CakesController < ApplicationController
    def index
        cakes = Cake.all 
        render json: cakes
    end

    def create 
        cake = Cake.create(cake_params)
        if cake.valid?
            render json: cake 
        else 
            render json: cakes.errors, status: 422
        end
    end

    private
    def cake_params
        params.require(:cake).permit(:cakeName, :cakeDescription, :cakeIngredients, :cakeInstructions, :cakeServings, :cakeImage, :user_id )
    end
end
