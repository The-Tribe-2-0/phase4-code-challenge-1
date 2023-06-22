require 'faker'

# Create Restaurants
3.times do
  restaurant = Restaurant.create(name: Faker::Restaurant.name, address: Faker::Address.full_address)
end

# Create Pizzas
3.times do
  pizza = Pizza.create(name: Faker::Food.dish, ingredients: Faker::Food.ingredients)
end

# Create RestaurantPizzas
Restaurant.all.each do |restaurant|
  rand(1..3).times do
    pizza = Pizza.all.sample
    RestaurantPizza.create(restaurant_id: restaurant.id, pizza_id: pizza.id, price: Faker::Commerce.price(range: 5..20.0))
  end
end
