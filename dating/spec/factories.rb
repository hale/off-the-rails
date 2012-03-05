FactoryGirl.define do
  factory :user_min do
    name                  'Example User'
    email                 'user@example.com'
    password              'foobar'
    password_confirmation 'foobar'
  end

  factory :user do
    name                  'Example User'
    email                 'user@example.com'
    password              'foobar'
    password_confirmation 'foobar'
  end

end