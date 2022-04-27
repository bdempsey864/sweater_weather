class User < ApplicationRecord
  has_many :api_keys, as: :bearer 

  validates :email, presence: true
  validates :email, format: /@/
  # validates :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :password, presence: true

  has_secure_password
end
