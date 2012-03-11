require 'spec_helper'

describe User do
  
  before(:each) do
    @user = User.new(name: 'Example User', email: 'user@example.com', password: 'foobar', password_confirmation: 'foobar')
  end

  subject { @user }
  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should be_valid }


  describe "it should require a name" do
    before { @user.name = ' ' }
    it { should_not be_valid }
  end

  describe "it should require an email address" do
    before { @user.email = ' ' }
    it { should_not be_valid }
  end

  describe "it should reject names that are too long" do
    before { @user.name = 'a'*26 }
    it { should_not be_valid }
  end

 describe "it should accept valid email addresses" do
    addresses = %w[ user@foo.com THE_USER@foo.bar.org first.last@foo.jp ]
    addresses.each do |address|
      before { @user.email = address }
      it { should be_valid }
    end
  end

  describe "should reject invalid email addresses" do
    addresses = %w[ user@foo,com user_at_foo.org example.user@foo. ]
    addresses.each do |address|
      before { @user.email = address }
      it { should_not be_valid }
    end
  end

  describe "should reject duplicate email addresses" do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.email = @user.email.upcase
      user_with_same_email.save
    end
    it { should_not be_valid }
  end

  describe "password validations" do

    describe "it should require a password" do
      before do
        @user.password = ''
        @user.password_confirmation = ''
      end
      it { should_not be_valid }
    end

    describe "should require a matching password validation " do
      before { @user.password_confirmation = 'somethingelse' }
      it { should_not be_valid }
    end

    describe "should reject short passwords" do
      before do
        @user.password = 'a'*5
        @user.password_confirmation = 'a'*5
      end
      it { should_not be_valid }
    end

    describe "should reject long passwords" do
      before do
        @user.password = 'a'*26
        @user.password_confirmation = 'a'*26
      end
      it { should_not be_valid }
    end

  end

 
# Tests for the 'relationships' concept

  it { should respond_to(:relationships) }
  it { should respond_to(:followed_users) }
  it { should respond_to(:following?) }
  it { should respond_to(:follow!) }
  it { should respond_to(:reverse_relationships) }
  it { should respond_to(:followers) }


  describe "adding to match list" do
    let(:other_user) { FactoryGirl.create(:user_bob) }
    before do
      @user.save
      @user.follow!(other_user)
    end

    it { should be_following(other_user) }
    its(:followed_users) { should include(other_user) }

    describe "followed user" do
      subject { other_user }
      its(:followers) { should include(@user) }
    end

    describe "removing from match list" do
      before { @user.unfollow!(other_user) }

      it { should_not be_following(other_user) }
      its(:followed_users) { should_not include(other_user) }
    end
  end



end



