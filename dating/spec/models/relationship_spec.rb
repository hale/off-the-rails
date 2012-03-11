require 'spec_helper'

describe Relationship do

  let(:user) { FactoryGirl.create(:user_bob) }
  let(:match) { FactoryGirl.create(:user_mary) }
  let(:relationship) do
    user.relationships.build(match_id: match.id)
  end

  subject { relationship }

  it { should be_valid }

  describe "user match methods" do
    before { relationship.save }

    it { should respond_to(:user) }
    it { should respond_to(:match) }
    its(:user) { should == user }
    its(:match) { should == match }
  end

  describe "when match id is not present" do
    before { relationship.match_id = nil }
    it { should_not be_valid }
  end

  describe "when user id is not present" do
    before { relationship.user_id = nil }
    it { should_not be_valid }
  end


end
