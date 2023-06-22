class Pizza < ApplicationRecord
    has_many :restaurant_pizzas
  has_many :restaurants, through: :restaurant_pizzas,dependent: :destroy
end
