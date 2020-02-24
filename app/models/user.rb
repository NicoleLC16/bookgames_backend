class User < ApplicationRecord
  has_secure_password
  has_many :posts
  has_many :games, through: :users_games
  has_many :users_games
  validates :username, uniqueness: { case_sensitive: false }
end
