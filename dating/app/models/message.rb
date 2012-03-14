class Message < ActiveRecord::Base
  attr_accessible :sender_id, :recipient_id, :time, :read, :msg_type, :message
end
