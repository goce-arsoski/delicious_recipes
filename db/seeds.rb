# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'factory_bot_rails'
require 'faker'

5.times do
  User.create(
    username: Faker::Internet.unique.username,
    email: Faker::Internet.unique.email,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    password: 'goce123',
    password_confirmation: 'goce123'
  )
end

6.times do
  Recipe.create(
    user_id: rand(1..5),
    title: Faker::Food.dish,
    description: Faker::Food.description,
    instructions_attributes: [
      { step: 'Preheat oven to 200 degrees C.' },
      { step: 'Grease a 300mm round baking dish.' },
      { step: 'Melt butter in large skillet over medium heat.' },
      { step: 'In a large bowl, whisk the eggs and milk together.' },
      { step: 'Stir all of the remaining ingredients, add the flour last, stirring as you go.' },
      { step: 'Add the last 1/4 cup flour slowly until the mixture gets thick.' },
      { step: 'Heat oil to 350 degrees.' },
      { step: 'Once oil is hot, dip the frozen mini dumpling into the batter.' },
      { step: 'Drop in fryer for 3 minutes or until golden brown and crispy.' },
      { step: 'Remove, drain on paper towel.' }
    ].sample(4),
    ingredients_attributes: [
      { name: Faker::Food.ingredient },
      { name: Faker::Food.ingredient },
      { name: Faker::Food.ingredient },
      { name: Faker::Food.ingredient },
      { name: Faker::Food.ingredient },
      { name: Faker::Food.ingredient },
      { name: Faker::Food.ingredient },
      { name: Faker::Food.ingredient },
      { name: Faker::Food.ingredient },
      { name: Faker::Food.ingredient },
      { name: Faker::Food.ingredient },
      { name: Faker::Food.ingredient },
      { name: Faker::Food.ingredient },
      { name: Faker::Food.ingredient }
    ].sample(6)
  )
end
