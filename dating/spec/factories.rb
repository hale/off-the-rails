FactoryGirl.define do
  factory :user_min do
    email                 'user@example.com'
    password              'foobar'
    password_confirmation 'foobar'
  end

end