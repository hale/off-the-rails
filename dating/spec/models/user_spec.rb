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
  it { should respond_to(:matches) }
  it { should respond_to(:match?) }
  it { should respond_to(:add_match!) }
  it { should respond_to(:reverse_relationships) }
  it { should respond_to(:interested_users) }


  describe "adding to match list" do
    let(:other_user) { FactoryGirl.create(:user_bob) }
    before do
      @user.save
      @user.add_match!(other_user)
    end

    it { should be_match(other_user) }
    its(:matches) { should include(other_user) }

    describe "interested user" do
      subject { other_user }
      its(:interested_users) { should include(@user) }
    end

    describe "removing from match list" do
      before { @user.remove_match!(other_user) }

      it { should_not be_match(other_user) }
      its(:matches) { should_not include(other_user) }
    end
  end



end




# == Schema Information
#
# Table name: users
#
#  id                  :integer         not null, primary key
#  created_at          :datetime        not null
#  updated_at          :datetime        not null
#  name                :string(255)
#  email               :string(255)
#  password_digest     :string(255)
#  avatar_file_name    :string(255)
#  avatar_content_type :string(255)
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#  dob                 :date
#  gender              :string(255)
#  location            :string(255)
#  about               :string(255)
#

