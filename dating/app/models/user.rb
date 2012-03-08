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
												 :length => { :within => 6..25} 
												 # :on => :create



	# User profile attributes

	has_attached_file :avatar, :styles => { :medium => "150x150>",
																				  :thumb => "50x50>" }

	validates_attachment_size :avatar, :less_than => 5.megabytes  
	validates_attachment_content_type :avatar, :content_type => ['image/jpeg', 'image/png']  

end
