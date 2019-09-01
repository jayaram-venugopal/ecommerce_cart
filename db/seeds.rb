# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

prices = [30 ,20 ,50 ,15]

input = Array.new(4) { {:name => Faker::Commerce.product_name, :price => prices[Random.rand(prices.length)], :quantity => Faker::Number.within(range: 1..10)}}

product = Product.create!(input)