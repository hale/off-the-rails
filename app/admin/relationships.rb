ActiveAdmin.register Relationship do
  index do
  	column "User", :id do |id|
  		User.find(id.user_id).name
  	end
  	column "Match", :id do |match|
  		User.find(match.match_id).name
  	end
  	default_actions
  end
end
