class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :title, presence: true, length: { maximun: 250 }
  validates :comments_counter,numericality: {only_integer: true, greater_than_or_equal_to: 0}

  # Registers a callback to be called after a record is created
  after_create :update_post_counter

  def update_post_counter
    user.update(posts_counter: user.posts.size)
  end

  def recent_comments
    comments.last(5)
  end
end
