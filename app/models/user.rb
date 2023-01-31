class User < ApplicationRecord
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, confirmation: true, length: { minimum: 3 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }

  def self.authenticate_with_credentials(email, password)
    user = User.find_by(email: email.downcase.strip)
    if user && user.authenticate(password)
      return user
    end
    return nil
  end

end
