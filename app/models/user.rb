class User < ApplicationRecord
  # Removes one or more objects from the collection by setting their foreign keys to NULL.
  # Objects will be in addition destroyed if they're associated with dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :name, presence: true
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def recent_posts
    posts.last(3)
  end
end
