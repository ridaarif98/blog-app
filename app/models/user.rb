class User < ApplicationRecord
  # Removes one or more objects from the collection by setting their foreign keys to NULL.
  # Objects will be in addition destroyed if they're associated with dependent: :destroy
  has_many :posts, foreign_key: 'author_id', dependent: :destroy
  has_many :comments, foreign_key: 'author_id', dependent: :destroy
  has_many :likes, foreign_key: 'author_id', dependent: :destroy

  def recent_posts
    posts.last(3)
  end
end
