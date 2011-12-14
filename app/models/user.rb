class User < ActiveRecord::Base
attr_accessible :id, :email, :password, :password_confirmation
  
  attr_accessor :password

  has_many :images

  before_save :encrypt_password
  
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email
  
  def self.authenticate(email, password)
    user = find_by_email(email)
    return nil  if user.nil?
    return user 
  end

  def self.authenticate_with_salt(id, cookie_salt)
   user = find_by_id(id)
   (user && user.password_salt == cookie_salt) ? user : nil
  end

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
end
