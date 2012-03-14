class Relationship < ActiveRecord::Base
  attr_accessible :match_id

  belongs_to :user, class_name: 'User'
  belongs_to :match, class_name: 'User'

  validates :user_id, presence: true
  validates :match_id, presence: true
end

# == Schema Information
#
# Table name: relationships
#
#  id         :integer         not null, primary key
#  user_id    :integer
#  match_id   :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

