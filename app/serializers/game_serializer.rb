class GameSerializer < ActiveModel::Serializer
  attributes :id, :title, :rules, :score, :tasks, :host, :posts, :users
  # has_many :posts
  # has_many :users

  def posts
    self.object.posts.sort_by{|post| post.id}.reverse
  end

  def users
    self.object.users.map{|user| {id: user.id, name: user.name, username: user.username}}
  end
end
