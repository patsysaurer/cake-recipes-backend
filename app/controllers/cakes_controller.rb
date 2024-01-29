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
            render json: cake.errors, status: 422
        end
    end

    def update
        cake = Cake.find(params[:id])
        cake.update(cake_params)
        if cake.valid?
            render json: cake 
        else 
            render json: cake.errors, status: 422
        end
    end

    def destroy
        cake = Cake.find(params[:id])
        if cake.destroy
            render json: cake
        else 
            render json: cake.errors, status: 422
        end    
    end

    private
    def cake_params
        params.require(:cake).permit(:cakeName, :cakeDescription, :cakeIngredients, :cakeInstructions, :cakeServings, :cakeImage, :user_id )
    end
end
