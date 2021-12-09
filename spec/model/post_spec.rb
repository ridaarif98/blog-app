require 'rails_helper'

RSpec.describe Post, type: :model do
    let(:user) {User.create(name: 'Rida')}
    let(:post) do
        described_class.create(user: user, title: 'My first post', text: 'Text to post', comments_counter: 0,
                               likes_counter: 0)
      end

    describe 'validations' do
        context 'when valid' do
            it { expect(post).to be_valid }
        end

        it 'should allow valid title' do
            post.title = 'This is my first post'* 15
            expect(post).to_not be_valid
        end

        it 'should allow valid comment_counter ' do
            post.comments_counter = 2.5
            expect(post).to_not be_valid
        end

        it 'should allow valid comment_counter ' do
            post.comments_counter = - 2
            expect(post).to_not be_valid
        end

        it 'should allow valid like_counter ' do
            post.likes_counter = - 2
            expect(post).to_not be_valid
        end

        it 'should allow valid like_counter ' do
            post.likes_counter = 2
            expect(post).to be_valid
        end
        it 'should allow valid like_counter ' do
            post.likes_counter = 0
            expect(post).to be_valid
        end
    end

    describe 'validates recent_comments method' do
        before {10.times { |i| post.comments.create(text: 'text#{i}')}}

        it 'should get last 5 comments' do
            expect(post.recent_comments).to eq(post.comments.last(5))
        end
    end
end