class User < ActiveRecord::Base
	attr_accessor :remember_token

  enum role: [:User, :Administrator]

	has_many :posts
  has_many :reviews
  has_many :comments
  has_many :books
	validates :username, presence: true, uniqueness: true, length: { maximum: 50}
	validates :email, presence: true, uniqueness: true
  mount_uploader :avatar, ImageUploader
	has_secure_password
	validates :password, presence: true, length: { minimum: 6 }, allow_blank: true
  ratyrate_rater
  def self.get_all_users
    self.all
  end

  def self.get_user(user_id)
    self.find(user_id)
  end

  def self.create_user(data_create)
    user = self.new(data_create)
    user.role = 'User'
    user.save
    return user
  end

  def self.update_user(user_id,data_update)
    user = self.find(user_id)
    user.update(data_update)

    return user
  end
  
  def reviewed?(book_id)
    Review.find_by({ :book_id => book_id , :user_id => self.id})
  end

  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # Returns a random token.
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  # Remembers a user in the database for use in persistent sessions.
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  # Returns true if the given token matches the digest.
  def authenticated?(remember_token)
  	return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  # Forgets a user.
  def forget
    update_attribute(:remember_digest, nil)
  end
  def is_admin?
    role == "Administrator" ? true : false
  end
end
