class User < ActiveRecord::Base
	attr_accessible :name, :email, :password, :password_confirmation, :avatar,
									:dob, :gender, :location, :about, :latitude, :longitude,
									:twitter, :status, :looking_for

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






	# User profile attributes

	has_attached_file :avatar, 
		:storage => :s3,
		:bucket => ENV['S3_BUCKET_NAME'],
		:s3_credentials => {
			:access_key_id => ENV['AWS_ACCESS_KEY_ID'],
			:secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
		}
		:styles => { 
			:medium => "150x150>",
			:thumb => "50x50>"
		},
		:default_url => 'http://i.imgur.com/sHZ3y.jpg'

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

	def add_interest!(name)
		self.interests.create!(user_id: self.id, name: name)
	end

	def shared_interests(other_user)
		user_i = []
		self.interests.each { |i| user_i << i.name }

		other_user_i = []
		other_user.interests.each { |i| other_user_i << i.name }

		return other_user_i & user_i
	end

	def match_percentage(other_user)
		user_i = []
		self.interests.each { |i| user_i << i.name }

		other_user_i = []
		other_user.interests.each { |i| other_user_i << i.name }

		# match percentage is an artificial measure of how similar you are to 
		# another user.  Arbitarily (*cough* I mean, using coitus cupid patented
		# dating research) a perfect score is given to users with more than 17
		# similar interests.  

		percentage = (other_user_i & user_i).count / 7.0 * 100
		if percentage > 100
			return 100
		else
			return (percentage.round(3) + rand*10.round(3)).round(2)
		end
	end

# Match list methods
	def match?(other_user)
		relationships.find_by_match_id(other_user.id)
	end

	def add_match!(other_user)
		self.relationships.create!(match_id: other_user.id)
	end

	def remove_match!(other_user)
		relationships.find_by_match_id(other_user.id).destroy
	end

	# Maps
	geocoded_by :location
	after_validation :geocode



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

