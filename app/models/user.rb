require 'bcrypt'

class User < ActiveRecord::Base
  attr_accessible :education, :email, :firstname, :lastname,:password_confirmation, :password, :latitude, :longitude
  attr_accessor :password_confirmation, :password


 before_save :hash_password, :if => :password_changed?
 before_save :create_remember_token  
  if !@latitude.nil? && !@longitude.nil?
  validates_confirmation_of :password, :if => :password_changed?
  before_save { |user| user.email = email.downcase }
           
 
  validates :firstname, :presence => true
  validates :lastname, :presence => true
  validates :email, :presence => true, :uniqueness => {:case_sensitive => false}#, :ala_confirm => true
  validate :ala_confirm 
  
  validates :password, :presence => true
  validates :password_confirmation, :presence => true
  end
	def password_changed?
  		!@password.blank?
  	end

  	def ala_confirm 
  		unless self.email.end_with?("alastudents.org") || self.email.ends_with?("alaalumni.org") || self.email.ends_with?("africanleadershipacademy.org") || self.email.ends_with?("africanleadershipfoundation.org")
  			errors.add(self.firstname,"- you must have an ala account!")
  		end
  	end

  private
  	def hash_password
  		self.hashed_password = BCrypt::Password.create(@password)
  	end

  	def create_remember_token
  		self.remember_token = SecureRandom.base64
  	end

end
