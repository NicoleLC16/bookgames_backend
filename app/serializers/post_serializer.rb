class PostSerializer < ActiveModel::Serializer
  attributes :id, :content, :ctype, :user_id, :game_id
  has_one :user
  has_one :game
end
