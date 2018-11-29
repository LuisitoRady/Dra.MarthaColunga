class User < ApplicationRecord
	 before_save { self.email = email.downcase }
	 VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  	belongs_to :category
    has_many :treatments
    has_many :archives
    has_many :appointments
  	validates :names, :lastnames, :age, :cellphone, :type, presence: true
  	validates :email, presence: true, length:{ maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false } 

  	has_secure_password
  	validates :password, presence: true, length: { minimum: 6 }
  	def self.types 
	 	 %w(Pacient Secretary Admin)
	 end

   def whole_name
    "#{names} #{lastnames}"
    end
end
