class User < ActiveRecord::Base

	has_many :relationships
	attr_accessible :name, :email, :password, :password_confirmation, :avatar

	#Rails 3.1 built in authentication
	has_secure_password

	EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i
  
	validates :name, 			 :presence     => true, 
												 :length       => { :maximum => 25 }

	validates :email,      :presence     => true, 
	                       :length       => { :maximum => 100 },
	                       :format       => EMAIL_REGEX, 
	                       :confirmation => true,
	                       :uniqueness   => { :case_sensitive => false }
	    
	validates :password,   :presence     => true,
												 :length => { :within => 6..25}, 
												 :on => :create

	# User profile attributes

	has_attached_file :avatar, :styles => { :medium => "100x100>",
																				  :thumb => "50x50>" }

end
