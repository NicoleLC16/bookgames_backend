class PostSerializer < ActiveModel::Serializer
  attributes :id, :content, :ctype
  has_one :user
  has_one :game
end
