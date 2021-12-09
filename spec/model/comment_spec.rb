require 'rails_helper'

RSpec.describe Comment, type: :model do

    describe 'Update like counter' do
        let(:user) {User.create(name: 'Rida')}
        let(:post) {Post.create(title: 'Test', text:'This is test post', user_id: user.id)}
        let(:comment) { Comment.create(user_id: user.id, post_id: post.id) }
   
        it 'should like counter for post' do
           post.comments.create(user: user)
           expect(post.comments_counter).to eq 1
        end
   
        it 'should like counter for post' do 
           expect(comment.update_comment_counter).to eq true
        end
    end
end