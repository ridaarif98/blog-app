require "rails_helper"

RSpec.describe 'Users', type: :request do
    describe 'GET #index' do
        before { get  users_path }
        it 'should return response status correct (ok)' do
            expect(response).to have_http_status(:ok)
        end

        it 'renders the index template' do
            expect(response).to render_template('index')
        end

        it 'response body includes correct placeholder text' do
            expect(response.body).to include('Here is the list of all users')
        end
    end

    describe 'GET #show' do
        before { get  user_path(id:1) }
        it 'should return response status correct (ok)' do
            expect(response).to have_http_status(:ok)
        end

        it 'renders the show template' do
            expect(response).to render_template('show')
        end

        it 'response body includes correct placeholder text' do
            expect(response.body).to include('Here is the profile of a selected user')
        end

        it 'responds to html by default' do
            expect(response.content_type).to eq "text/html; charset=utf-8"
        end
    end
end 