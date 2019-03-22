require 'faker'
User.create(email: 'j.grey@x-men.org', name: 'Jean Grey', password: 'pho3nix')
User.create(email: 'profx@x-men.org', name: 'Professor X', password: '12345678')
User.create(email: 'h.mccoy@x-men.org', name: 'Hank', password: 'the3b3ast')

users = User.all

30.times do 
  Topic.create(title: Faker::Hipster.sentence, body: Faker::Hipster.paragraph(2), user: users.sample )
end
