class RestaurantPizzasController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:create]
    def create
      restaurant_pizza = RestaurantPizza.create(restaurant_pizza_params)
    
      if restaurant_pizza.persisted?
        render json: restaurant_pizza, status: :created
      else
        render json: { errors: restaurant_pizza.errors.full_messages }, status: :unprocessable_entity
      end
    end
    
      
    def index
        restaurants = RestaurantPizza.all
        render json: restaurants
    end

    private 
    def restaurant_pizza_params
        params.permit(:price,:pizza_id, :restaurant_id)
    end
end
