class Interests < ActiveRecord::Base
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

