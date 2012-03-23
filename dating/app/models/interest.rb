class Interest < ActiveRecord::Base
  attr_accessible :name, :user_id

  belongs_to :user

  validates :name, :presence => true


end

# == Schema Information
#
# Table name: interests
#
#  id         :integer         not null, primary key
#  interest   :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  name       :string(255)
#  user_id    :integer
#

