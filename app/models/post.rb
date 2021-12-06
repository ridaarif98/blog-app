class Post < ApplicationRecord
    belongs_to :user
    has_many :likes, dependent: :destroy
    has_many :comments, dependent: :destroy

    # A method that updates the posts counter for a user.
    after_create :update_post_counter

    def update_post_counter
        user.update(user.posts_counter: user.posts.size)
    end

    def recent_comments
        comments.last(5)
    end
end