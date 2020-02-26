class GameSerializer < ActiveModel::Serializer
  attributes :id, :title, :rules, :score, :tasks, :host
  has_many :posts
  has_many :users
end
