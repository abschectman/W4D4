class User < ApplicationRecord
  validates :session_token, presence: true
  validates :password_digest, presence: true
  validates :email, presence: true
  validates :password, length: { minimum: 6, allow: nil }
  after_initialize :ensure_session_token
  attr_reader :password


  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def ensure_session_token
    self.session_token ||= SecureRandom::urlsafe_base64
  end

  def reset_session_token!
    self.session_token = SecureRandom::urlsafe_base64
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def self.find_by_credentials(password, email)
    user = User.find_by(email: email)
    if user && user.is_password?(password)
      return user
    end
  end
    






end