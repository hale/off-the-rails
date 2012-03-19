namespace :db do
  desc "Fill in the database with pretend users"
  task populate: :environment do
    make_users
    make_relationships
    make_messages
    make_interests
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
    dob      = Date.current.years_ago(rand(60-18)+18)
    gender   = ['Male', 'Female'].at((rand(100).odd? ? 0 : 1))
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
    Message.create!(user_id: rand(100),
                   sender_id: rand(100),
                   msg_type: ['wink', 'nudge'].at((rand(100).odd? ? 0 : 1)),
                   read: 0,
                   message: Faker::Lorem.paragraph(4) )
  end
end

# Give each user between 0 and 30 interests
def make_interests
  users = User.all
  users.each do |user|
    interests_count = rand(0..30)
    interests_count.times do
      # Interest.create!( user_id: user.id, 
                        # name: Faker::Lorem.words(1).first.capitalize )
      user.add_interest!( Faker::Lorem.words(1).first.capitalize ) 
    end
  end
end
