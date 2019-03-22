# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
User.create(email: 'j.grey@x-men.org', name: 'Jean Grey', password: 'pho3nix')
User.create(email: 'profx@x-men.org', name: 'Professor X', password: '12345678')
User.create(email: 'h.mccoy@x-men.org', name: 'Hank', password: 'the3b3ast')
