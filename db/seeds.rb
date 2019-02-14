# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# require 'faker'

require 'json'
puts "Deleting DB....."

Cocktail.destroy_all
Ingredient.destroy_all

puts 'Creating 10 fake cocktails...'

10.times do
  cocktail = Cocktail.new(
    name: Faker::Space.unique.star
  )
  cocktail.save!
end

url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
user_serialized = open(url).read
result = JSON.parse(user_serialized)
  result['drinks'].each do |item|
    Ingredient.create!(name: item["strIngredient1"])
    # p item['strIngredient1']
  end

puts 'Finished!'
