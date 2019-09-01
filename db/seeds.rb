# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

input = [{:name => Faker::Commerce.product_name, :price => 30, :category => "A", :quantity => Faker::Number.within(range: 5..10)}, {:name => Faker::Commerce.product_name, :price => 20, :category => "B", :quantity => Faker::Number.within(range: 5..10)}, {:name => Faker::Commerce.product_name, :price => 50, :category => "C", :quantity => Faker::Number.within(range: 5..10)}, {:name => Faker::Commerce.product_name, :price => 15, :category => "D", :quantity => Faker::Number.within(range: 5..10)}]

product = Product.create!(input)