class User < ActiveRecord::Base
	validates :given_name, :presence => { :message => "First name can't be blank" }
	validates :surname, :presence => { :message => "Last name can't be blank" }
	email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
	validates :email, :format => { :with => email_regex, :message => "Email isn't valid" }
	validates :email, :uniqueness => { :case_sensitive => false, :message => "Email address is already registered" }
	validates :location, :presence => { :message => "Location can't be blank" }
	validates :region, :presence => { :message => "Region (state or province) can't be blank" }
	validates :password, :length => { :minimum => 8 }, :on => :create
	has_secure_password

	before_save do
		self.email.downcase!
	end

	def full_name
		self.given_name + " " + self.surname
	end
end
