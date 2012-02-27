class User < ActiveRecord::Base
	attr_accessible :name, :email, :password, :password_confirmation

	#Rails 3.1 built in authentication
	has_secure_password

	EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i
  

	validates :first_name, :presence     => true, 
												 :length       => { :maximum => 25 }

	validates :last_name,  :presence     => true, 
												 :length       => { :maximum => 50 }
												 
	validates :username,   :length       => { :within => 5..25 }, 
												 :uniqueness   => true

	validates :email,      :presence     => true, 
	                       :length       => { :maximum => 100 },
	                       :format       => EMAIL_REGEX, 
	                       :confirmation => true
	    
	validates :password,   :presence     => true,
												 :length => { :within => 5..25}, 
												 :on => :create

end
