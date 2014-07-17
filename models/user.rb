class User

  include MongoMapper::Document

  key :name,        String
  key :email,      String
  key :password_hash,      String
  key :password_salt,      String
  key :api_key, 	String
  timestamps!

  many :applications

  attr_accessor :password

  before_create :encrypt_password
  before_create :create_user_api_key
  
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email
  validate :valid_email
  
  def valid_email
  	unless email and email.include?("@") and email.include?(".") then
  		errors.add( :email, "Invalid email address.")
  	end
  end

  def create_user_api_key
	self.api_key = SecureRandom.hex(11)
  end

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

  def self.authenticate(email, password)  
	  user = find_by_email(email)
	  if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt) then
	    user
	  else
	    nil
	  end
  end

end