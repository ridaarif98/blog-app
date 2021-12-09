require 'rails_helper'

RSpec.describe User, type: :model do
    subject {User.new(name:"Ali", photo: "https://www.qttoyslondon.com/wp-content/uploads/2021/01/pokemon-45inch-battle-figure-gengar-150x150.jpg", bio: "I am Tom, I am passionate about programming.")}
    before { subject.save }

    it 'name should be present' do
        subject.name = nil
        expect(subject).to_not be_valid
    end

    it 'should valid the name' do
        subject.name = 'Rida'
        expect(subject).to be_valid
    end

    describe 'Post counter' do

        it 'should allow valid values' do
            subject.posts_counter = 2.5
            expect(subject).to_not be_valid
        end

        it 'should allow valid values' do
            subject.posts_counter = -2
            expect(subject).to_not be_valid
        end

        it 'should allow valid values' do
            subject.posts_counter = 0
            expect(subject).to be_valid
        end

        it 'should allow valid values' do
            subject.posts_counter = 2
            expect(subject).to be_valid
        end
    end

    describe 'validates recent_posts method' do
        before {10.times { |i| Post.create(user:subject, title: 'post#{i}')}}

        it 'should get last 5 comments' do
            expect(subject.recent_posts).to eq(subject.posts.last(3))
        end
    end
end