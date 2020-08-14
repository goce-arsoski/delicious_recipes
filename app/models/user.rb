class User < ApplicationRecord
  MAX_USERNAME_LENGTH = 30
  MAX_EMAIL_LENGTH = 50
  MIN_PASSWORD_LENGTH = 6
  MIN_FIRST_NAME_LENGTH = 2
  MAX_FIRST_NAME_LENGTH = 100
  MIN_LAST_NAME_LENGTH = 2
  MAX_LAST_NAME_LENGTH = 100
  VALID_USERNAME_REGEX = /\A[a-zA-Z0-9]+([._]?[a-zA-Z0-9]+)*\z/
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  has_secure_password

  has_many :recipes, dependent: :destroy

  before_save :email_to_downcase

  validates :username, presence: true, length: { maximum: MAX_USERNAME_LENGTH },
  format: { with: VALID_USERNAME_REGEX },
  uniqueness: true
  validates :email, presence: true, length: { maximum: MAX_EMAIL_LENGTH },
  format: { with: VALID_EMAIL_REGEX },
  uniqueness: true
  validates :password, presence: true, length: { minimum: MIN_PASSWORD_LENGTH }
  validates :first_name, presence: true, length: { minimum: MIN_FIRST_NAME_LENGTH, maximum: MAX_FIRST_NAME_LENGTH }
  validates :last_name, presence: true, length: { minimum: MIN_LAST_NAME_LENGTH, maximum: MAX_LAST_NAME_LENGTH }

  private

  def email_to_downcase
    self.email = email.downcase
  end
end
