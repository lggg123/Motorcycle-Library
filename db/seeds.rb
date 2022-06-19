# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Motorcycle.destroy_all
User.destroy_all

5.times do 
    User.create(first_name: Faker::Name.name,
                last_name: Faker::Name.name, 
                email: Faker::Internet.email,  
            )
end

users = User.all

10.times do 
    Motorcycle.create(title: Faker::Name.name,
                    description: Faker::Restaurant.description,
                    image_url: Faker::LoremFlickr.image,
                    user: users[rand(0..4)]
                    )
end 

