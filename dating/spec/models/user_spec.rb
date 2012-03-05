require 'spec_helper'

describe User do
  
  before(:each) do
    @attr = {
      :name => "Example",
      :email => "user@example.com",
      :password => "foobar",
      :password_confirmation => "foobar"
    }
  end

  it "should create a new instance given valid attributes" do
    User.create!(@attr)
  end

  it "should require a name" do
    no_name_user = User.new(@attr.merge(:name => ''))
    no_name_user.should_not be_valid
  end

  it "should require an email address" do
    no_email_user = User.new(@attr.merge(:email => ''))
    no_email_user.should_not be_valid
  end

  it "should reject names that are too long" do
    long_name = 'a' * 26
    long_name_user = User.new(@attr.merge(:name => long_name))
    long_name_user.should_not be_valid
  end

  it "should accept valid email addresses" do
    addresses = %w[ user@foo.com THE_USER@foo.bar.org first.last@foo.jp ]
    addresses.each do |address|
      valid_email_user = User.new(@attr.merge(:email => address))
      valid_email_user.should be_valid
    end
  end

  it "should reject invalid email addresses" do
    addresses = %w[ user@foo,com user_at_foo.org example.user@foo. ]
    addresses.each do |address|
      invalid_email_user = User.new(@attr.merge(:email => address))
      invalid_email_user.should_not be_valid
    end
  end

  it "should reject duplicate email addresses" do
    # put a user with a given email address into the db
    User.create!(@attr)
    user_with_duplicate_email = User.new(@attr)
    user_with_duplicate_email.should_not be_valid
  end

  it "should reject email addresses identical ignoring case" do
    upcased_email = @attr[:email].upcase
    User.create!(@attr.merge(:email => upcased_email))
    user_with_duplicate_email = User.new(@attr)
    user_with_duplicate_email.should_not be_valid
  end

  describe "password validations" do

    it "should require a password" do
      User.new(@attr.merge(:password => '', :password_confirmation => '')).
        should_not be_valid
    end

    it "should require a matching password validation " do
      User.new(@attr.merge(:password_confirmation => 'different')).
        should_not be_valid
    end

    it "should reject short passwords" do
      short = 'a' * 5
      short_password_user = @attr.merge(:password => short, :password_confirmation => short)
      User.new(short_password_user).should_not be_valid
    end

    it "should reject long passwords" do
      long = 'a' * 26
      long_password_user = @attr.merge(:password => long, :password_confirmation => long)
      User.new(long_password_user).should_not be_valid
    end

  end



end



