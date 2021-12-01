require "rails_helper"

RSpec.describe 'Posts', type: :request do
    describe 'GET #index' do
        before { get  user_posts_path(1) }
        it 'should return response status correct (ok)' do
            expect(response).to have_http_status(:ok)
        end

        it 'renders the index template' do
            expect(response).to render_template('index')
        end

        it 'response body includes correct placeholder text' do
            expect(response.body).to include('Here is the list of all posts of a user')
        end

        it 'respons to html' do
            expect(response.content_type).to include "text/html"
        end
    end

    describe 'GET #show' do
        before { get  user_post_path(1,2) }
        it 'should return response status correct (ok)' do
            expect(response).to have_http_status(:ok)
        end

        it 'renders the show template' do
            expect(response).to render_template('show')
        end

        it 'response body includes correct placeholder text' do
            expect(response.body).to include('Here is detail of a post')
        end

        it 'responds to html' do
            expect(response.content_type).to include "text/html"
        end
    end
end 