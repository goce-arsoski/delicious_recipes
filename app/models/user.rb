class User < ApplicationRecord
  has_secure_password

  has_many :recipes, dependent: :destroy
end
