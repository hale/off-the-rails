class User < ActiveRecord::Base
	attr_accessible :name, :email, :password, :password_confirmation

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

end
