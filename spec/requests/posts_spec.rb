require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  include Devise::Test::IntegrationHelpers

  let(:user) { User.create(name: 'Kolly', email: 'kolly@mail.com', password: 'password') }
  let(:post) { user.posts.create(title: 'Post',text: 'Test', comments_counter: 2, likes_counter: 4) }
  
  describe 'GET #index' do
  before do
    sign_in user
    get user_posts_path(user_id: post.user_id)
  end
    it 'should return response status correct (ok)' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders the index template' do
      expect(response).to render_template('index')
    end

    it 'respons to html' do
      expect(response.content_type).to include 'text/html'
    end
  end

  describe 'GET #show' do

    before do
      sign_in user
      get user_post_path(user_id: user.id, id: post.id)
    end

    it 'should return response status correct (ok)' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders the show template' do
      expect(response).to render_template('show')
    end

    it 'responds to html' do
      expect(response.content_type).to include 'text/html'
    end
  end
end
