# class User < ApplicationRecord
#
#   has_secure_password
#
#   PASSWORD_FORMAT = /\A
#     (?=.{8,})          # Must contain 8 or more characters
#     (?=.*\d)           # Must contain a digit
#     (?=.*[a-z])        # Must contain a lower case character
#     (?=.*[A-Z])        # Must contain an upper case character
#     (?=.*[[:^alnum:]]) # Must contain a symbol
#   /x
#
#   validates :username,
#             presence: true,
#             uniqueness: true
#   validates :password,
#             presence: true,
#             length: { within: 8..40 },
#             format: { with: PASSWORD_FORMAT },
#             on: :create
#
#   def generate_token
#     SecureRandom.urlsafe_base64(nil, false)
#   end
#
# end
class User < Ohm::Model
  attribute :username
  attribute :password_digest

  unique :username
  index :username

  def password= string
    self.password_digest = BCrypt::Password.create(string)
  end

  def password_valid? string
    BCrypt::Password.new(self.password_digest) == string
  end

  def generate_token
    SecureRandom.urlsafe_base64(nil, false)
  end

  def serialized
    {
        id: self.id,
        username: self.username
    }
  end

end