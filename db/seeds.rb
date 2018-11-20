# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

dogs_attributes = [
        {
          name: 'Fido',
          age: 2,
          enjoys: "Chasing pigeons at the park",
          picture: "insert picture here 1 "
        },
        {
          name: 'Max',
          age: 4,
          enjoys: "Swimming in neighbors pool",
          picture: "insert picture here 1 "
        },
        {
          name: 'Bolt',
          age: 12,
          enjoys: "Wearing Pikachu costumes",
          picture: "insert picture here 1 "
        },
        {
          name: 'Gamjachib',
          age: 1,
          enjoys: "being a potato chip",
          picture: "insert picture here 1 "
        },
        {
          name: 'Air Bud',
          age: 3,
          enjoys: "Playing Basketball",
          picture: "insert picture here 1 "
        }
      ]

      dogs_attributes.each do |attributes|
        Dog.create(attributes)
      end
