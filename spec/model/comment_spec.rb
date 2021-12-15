require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe '#update_counter' do
    let(:user) { User.create(name: 'Kolly', email: 'kolly@mail.com', password: 'password') }
    let(:post) { Post.create(title: 'Post', text: 'Hello', user_id: user.id) }

    it 'should like counter for post' do
      expect(post.comments_counter).to eq 0
    end
  end
end
