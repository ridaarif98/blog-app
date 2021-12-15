require 'rails_helper'

RSpec.describe 'Users', type: :request do
  include Devise::Test::IntegrationHelpers

  let(:user) { User.create(name: 'Cork', email: 'example@mail.com', password: 'password') }
  describe 'GET #index' do
    before do
      sign_in user
      get users_path
    end
    it 'should return response status correct (ok)' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders the index template' do
      expect(response).to render_template('index')
    end
  end

  describe 'GET #show' do
    before do
      sign_in user
      get user_path(user)
    end
    it 'should return response status correct (ok)' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders the show template' do
      expect(response).to render_template('show')
    end

    it 'responds to html by default' do
      expect(response.content_type).to eq 'text/html; charset=utf-8'
    end
  end
end
