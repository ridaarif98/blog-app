require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'Update like counter' do
    let(:user) { User.create(name: 'Rida') }
    let(:post) { user.posts.create(title: 'Test', text: 'This is test post', user: user) }
    let(:like) { Like.create(user_id: user.id, post_id: post.id) }

    it 'should like counter for post' do
      post.likes.create(user: user)
      expect(post.likes_counter).to eq 1
    end

    it 'should like counter for post' do
      expect(like.update_like_counter).to eq true
    end
  end
end
