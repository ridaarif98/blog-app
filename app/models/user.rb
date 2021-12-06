class User < ApplicationRecord
    # Removes one or more objects from the collection by setting their foreign keys to NULL. 
    # Objects will be in addition destroyed if they're associated with dependent: :destroy
    belongs_to :posts, dependent: :destroy
    belongs_to :comments, dependent: :destroy
    belongs_to :likes, dependent: :destroy

    def recent_posts
        User.last(3)
    end
end