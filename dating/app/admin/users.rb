ActiveAdmin.register User do
  index do
  	column :id
  	column :name
  	column :email
  	column :dob
  	column :about
  	column :location
  	column :gender
  	default_actions
  end
end
