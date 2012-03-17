namespace :db do
  desc "Fill in the database with pretend users"
  task populate: :environment do
    make_users
    make_relationships
    make_messages
  end
end

def make_users
  User.create(name:                  'Pretend User',
              email:                 'example@example.com',
              password:              'example',
              password_confirmation: 'example',
              avatar:                'http://i.imgur.com/JLCcG.jpg',
              dob:                   Date.current.years_ago(23),
              gender:                'Unicorn',
              location:              'Birmingham',
              about:                 Faker::Lorem.paragraph(4) )
  99.times do |n|
    name     = Faker::Name.name
    email    = Faker::Internet.email
    password = 'password'
    dob      = Date.current.years_ago(rand(18..60))
    gender   = ['Male', 'Female'].at((rand(1..100).odd? ? 0 : 1))
    location = Faker::Lorem.words(1).first.capitalize
    about    = Faker::Lorem.paragraphs(1).first
    User.create!(name: name,
                 email: email, 
                 password: password, 
                 password_confirmation: password, 
                 dob: dob,
                 gender: gender,
                 location: location,
                 about: about )
  end
end

def make_relationships
  users = User.all
  # This is the user that will have all the relationships
  user             = users.first
  matches          = users[2..50]
  interested_users = users[3..40]

  matches.each          { |match|  user.add_match!(  match ) }
  interested_users.each { |i_user| i_user.add_match!( user  ) }
end

def make_messages
  99.times do |n|
    Message.create!(user_id: rand(1..100),
                   sender_id: rand(1..100),
                   msg_type: ['wink', 'nudge'].at((rand(1..100).odd? ? 0 : 1)),
                   read: 0,
                   message: Faker::Lorem.paragraph(4) )
  end
end
