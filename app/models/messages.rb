class Messages < ActiveRecord::Base
  belongs_to :relationship
end

# == Schema Information
#
# Table name: messages
#
#  id              :integer         not null, primary key
#  relationship_id :integer
#  message         :string(255)
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#

