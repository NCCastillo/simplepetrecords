class User < ActiveRecord::Base
	has_secure_password

	attr_accessible :first_name, :last_name, :email, :password, :password_confirmation

	validates_presence_of :first_name, :last_name, :email
	validates_uniqueness_of :email
	validates :email, :format => {:with => /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
	validates_length_of :password, :minimum => 6, :message => "Password must be at least 6 characers"

	
end