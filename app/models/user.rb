class User < ActiveRecord::Base
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :password, presence: true #password_digest 
  validates :password, length: { in: 6..10 }
  validates :password_confirmation, presence: true

  def self.authenticate_with_credentials(email, password)
  email.downcase!
  email.gsub!(/\s+/, '')
   user = User.find_by_email(email)

    if user && user.authenticate(password)
      user
    else 
      nil
    end
  end
end
