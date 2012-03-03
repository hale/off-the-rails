require 'factory_girl'

FactoryGirl.define do
  factory :user_min do |f|
    f.email                 'user@example.com'
    f.password              'foobar'
    f.password_confirmation 'foobar'