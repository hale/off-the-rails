class TimelineUpdates < ActiveRecord::Base
  belongs_to :user
end

# == Schema Information
#
# Table name: timeline_updates
#
#  id         :integer         not null, primary key
#  user_id    :integer
#  message    :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

