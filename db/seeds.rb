# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

input = [{:name => Faker::Commerce.product_name, :price => 30, :quantity => Faker::Number.within(range: 5..10)}, {:name => Faker::Commerce.product_name, :price => 20, :quantity => Faker::Number.within(range: 5..10)}, {:name => Faker::Commerce.product_name, :price => 50, :quantity => Faker::Number.within(range: 5..10)}, {:name => Faker::Commerce.product_name, :price => 15, :quantity => Faker::Number.within(range: 5..10)}]

@products = Product.create!(input)

Product.find_by(:price => 30).create_product_discount(:discount_price => 5.0, :no_of_products => 3)
Product.find_by(:price => 20).create_product_discount(:discount_price => 2.5, :no_of_products => 2)

CartDiscount.create!({:discount_price => 20.0, grand_total: 150})