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

  factory :user_bob, :class => User do
    name                  'Bob'
    email                 'bob@example.com'
    password              'foobar'
    password_confirmation 'foobar'
    dob                   Date.new.years_ago 34
    gender                'Male'
    about                 'I would say that above all, I am searching for a woman that has the confidence to know that she is worth my time. Someone that knows how to have a good time and will pull me out of the rut that I tend to settle in will capture my attention easily.'
  end

  factory :user_mary, :class => User do
    name                  'Mary'
    email                 'mary@example.com'
    password              'foobar'
    password_confirmation 'foobar'
    dob                   Date.new.years_ago 41
    gender                'Female'
    about                 'I have been lucky in life and now I am looking to be lucky in love. I am a fun loving lady who loves to have a good time,  and fully believe that laughter truly is the best medicine. However, that said,  I do  know when and where to be serious and respect that trait in others as well.\n\nI enjoy a wide range of activities from your stereotypical walk on the beach to something more offbeat like painting in the park. Generally I consider myself to be very open to new experiences and will try almost anything once.'
  end

end