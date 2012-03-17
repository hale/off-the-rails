class User < ActiveRecord::Base
	attr_accessible :name, :email, :password, :password_confirmation, :avatar,
									:dob, :gender, :location, :about, :latitude, :longitude, :twitter, :status

	#Rails 3.1 built in authentication
	has_secure_password

	EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i
  
	validates :name, 			 :presence     => true, 
												 :length       => { :maximum => 25 }

	validates :email,      :presence     => true, 
	                       :length       => { :maximum => 100 },
	                       :format       => {with: EMAIL_REGEX}, 
	                       :confirmation => true,
	                       :uniqueness   => { :case_sensitive => false }

	validates :password,   :presence     => true,
												 :length => { :within => 6..25} 
												 # :on => :create

	validates :about,			:length => { :maximum => 100000 }






	# User profile attributes

	has_attached_file :avatar, :styles => { :medium => "150x150>",
																				  :thumb => "50x50>" },
														 :default_url => 'http://i.imgur.com/qOatH.png'
														 # :default_url => "images/avatar_:style.png"

	validates_attachment_size :avatar, :less_than => 5.megabytes  
	validates_attachment_content_type :avatar, :content_type => ['image/jpeg', 'image/png']  

# relationships

	has_many :relationships, foreign_key: "user_id", dependent: :destroy
	has_many :matches, through: :relationships, source: :match

	has_many :reverse_relationships, foreign_key: "match_id",
																	 class_name:  "Relationship",
																	 dependent:   :destroy
  has_many :interested_users, through: :reverse_relationships, source: :user
  
  has_many :messages

# interests

	has_many :interests, dependent: :destroy


	def match?(other_user)
		relationships.find_by_match_id(other_user.id)
	end

	def add_match!(other_user)
		self.relationships.create!(match_id: other_user.id)
	end

	def remove_match!(other_user)
		relationships.find_by_match_id(other_user.id).destroy
	end

acts_as_gmappable :process_geocoding => false, :msg => "Sorry, not even Google could figure out where that is"


def gmaps4rails_address
  #"#{self.location}"
  "#{self.latitude}, #{self.longitude}"
end

end

# == Schema Information
#
# Table name: users
#
#  id                  :integer         not null, primary key
#  created_at          :datetime        not null
#  updated_at          :datetime        not null
#  name                :string(255)
#  email               :string(255)
#  password_digest     :string(255)
#  avatar_file_name    :string(255)
#  avatar_content_type :string(255)
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#  dob                 :date
#  gender              :string(255)
#  location            :string(255)
#  about               :string(255)
#

