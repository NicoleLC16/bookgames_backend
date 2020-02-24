class GameSerializer < ActiveModel::Serializer
  attributes :id, :rules, :score, :tasks, :host
  has_many :posts
  has_many :users
end
