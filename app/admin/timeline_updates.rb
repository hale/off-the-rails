ActiveAdmin.register TimelineUpdates do
  index do
  	column :user do |user|
  		User.find(user).name
  	end
  	column :message
  	column :created_at
  	default_actions
  end
end
