class Relationship < ActiveRecord::Base
  attr_accessible :match_id

  belongs_to :user, class_name: 'User'
  belongs_to :match, class_name: 'User'

  validates :user_id, presence: true
  validates :match_id, presence: true
end
