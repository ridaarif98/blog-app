require 'swagger_helper'

RSpec.describe 'api/posts', type: :request do
    path 'api/v1/posts' do
        get('list all posts') do
            produces 'application/json'
            consumes 'application/json'
            response(200, 'Success') do
                
                schema type: :object,
                properties: {
                 id: { type: :integer },
                 title: { type: :string },
                 text: { type: :string }
               },
               required: %w[id title text]
               let(:post) {Post.all}
               run_test!
            end
            response '406', 'unsupported accept header' do
                let(:Accept) { 'application/json' }
                run_test!
            end
        end
    end
end