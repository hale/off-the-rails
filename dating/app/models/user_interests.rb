class UserInterests < ActiveRecord::Base
  belongs_to :user
  belongs_to :interest
end
