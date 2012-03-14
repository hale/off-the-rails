# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :message do
    sender_id 1
    recipient_id 1
    time ""
    read false
    type ""
    message "MyText"
  end
end
