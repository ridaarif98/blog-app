require "rails_helper"

RSpec.describe 'Users', type: :request do
    describe 'GET #index' do
        before { get  users_path }
        it 'should return response status correct (ok)' do
            expect(response).to have_http_status(:ok)
        end
    end
end 