class Game < ApplicationRecord
  has_many :posts
  has_many :users_games
  has_many :users, through: :users_games
end
