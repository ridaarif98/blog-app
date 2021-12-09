class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :text, presence: true, length: { minimum: 3 }
  # Registers a callback to be called after a record is created
  after_create :update_comment_counter

  def update_comment_counter
    # size will try to pick the most appropriate of the two to avoid excessive queries for count and length
    post.update(comments_counter: post.comments.size)
  end
end
