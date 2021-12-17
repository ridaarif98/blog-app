require 'swagger_helper'

RSpec.describe 'api/comments', type: :request do
    
    path 'api/v1/posts/{post_id}/comments' do

        parameter name: 'post_id', in: :path, type: :string, description: 'post_id'
        get('list post comments') do
            response(200, 'successful') do
                let(:post_id) { '123' }
                response '201', 'Post created' do
                    schema type: :object,
                    properties: {
                          id: { type: :string }
                        }
                    let(:comment) { { text: 'Text' } }
                    let(:post_id) { FactoryBot.create(:post_with_comments, user: @user).id }
                    run_test!
                end
            end
        end


        post('create comment') do
            produces 'application/json'
            consumes 'application/json'
            parameter name: :comment, in: :body, schema: {
              type: :object,
              properties: {
                text: { type: :string }
              }
            }
      
            response '201', 'Post created' do
              let(:comment) { { text: 'Text' } }
              let(:post_id) { FactoryBot.create(:post, user: @user).id }
              run_test!
            end
        end
    end
end