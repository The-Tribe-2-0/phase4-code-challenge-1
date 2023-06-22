class RestaurantsController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:destroy]
    def index 
        restaurant= Restaurant.all
        render json: restaurant
    end

    def show
        restaurant= Restaurant.find_by(id:params[:id])
        if restaurant
        render json:restaurant, include: :pizzas
        else  
            render json:{error:'restaurant not found'}, status: 404
         end
   
    end

    def destroy
        restaurant = Restaurant.find_by(id: params[:id])
      
        if restaurant
          restaurant.destroy
          render json: { message: 'Restaurant deleted' }
        else
          render json: { error: 'Restaurant not found' }, status: 404
        end
      end
      
end
