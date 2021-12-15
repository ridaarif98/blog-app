require 'rails_helper'
RSpec.feature 'User Show', type: :feature do
  before(:each) do
    @first_user = User.create(name: 'Rous', email: 'other@example.com', password: 'rous12')
    
    @post_one = Post.create(title: 'motivation', text: 'Never give up', user_id: @first_user.id)
  
    5.times { |a| Comment.create(user_id: @first_user.id, post_id: @post_one.id, text: "Hello#{a}") }
    @comment = Comment.create(user_id: @first_user.id, post_id: @post_one.id, text: "Hello")
    

    Like.create(user_id: @first_user.id, post_id: @post_one.id)
    visit user_session_path
    fill_in 'email', with: 'other@example.com'
    fill_in 'pwd', with: 'rous12'
    click_button 'Log in'
    click_link('Rous')
    click_link('See all posts')
    click_link('Post #1')
  end

  it 'display the all posts path for first user' do
    expect(page).to have_current_path("/users/#{@first_user.id}/posts/#{@post_one.id}")
  end

  it 'display forth post title' do
    expect(page).to have_content @post_one.title
  end

  it 'display name of user who posted' do
    user = User.find(@post_one.user_id)
    expect(page).to have_content user.name
  end

  it 'display comments count' do
    expect(page).to have_content('Comments: 6')
  end

  it 'display likes count' do
    expect(page).to have_content('Likes: 1')
  end

  it 'display post body' do
    expect(page).to have_content @post_one.text
  end

  it 'display person name who commented' do
    expect(page).to have_content User.find(@comment.user_id).name
  end

  it 'display comment text' do
    expect(page).to have_content @comment.text
  end
end
