class Message < ActiveRecord::Base
  attr_accessible :user_id, :sender_id, :time, :read, :msg_type, :message
  
  belongs_to :user

end
