# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string
#  password_digest :string
#  session_token   :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
  validates :username, :password_digest, :session_token, presence: true
  validates :password, length: { minimum: 6, allow_nil: true }
  after_initialize :ensure_session_token

  has_many :subs
  has_many :posts
  has_many :comments 
  attr_reader :password

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password).to_s
  end

  def self.gen_token
    SecureRandom::urlsafe_base64(16)
  end

  def reset_token
    self.session_token = User.gen_token
    self.save
    self.session_token
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def self.find_by_credentials(username, password)
    u = User.find_by(username: username)
    return nil if u.nil?
    return u if u.is_password?(password)
    nil
  end

  private

  def ensure_session_token
    self.session_token ||= User.gen_token
  end
end
