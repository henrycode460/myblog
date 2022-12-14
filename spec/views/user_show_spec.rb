require 'rails_helper'

RSpec.describe 'user#Show', type: :feature do
  describe 'User Model' do
    before(:each) do
      @user1 = User.create(name: 'Henry', photo: 'Tom.png', bio: 'bio', posts_counter: 0)
      @user2 = User.create(name: 'Cecilia', bio: 'bio', photo: 'Tom.png')
      @user3 = User.create(name: 'Nadia', bio: 'bio', photo: 'Tom.png')

      visit root_path

      @post1 = Post.create(title: 'First Post', text: 'Post number one', comments_conter: 0, likes_counter: 0,
                           author: @user1)
      @post2 = Post.create(title: 'Second Post', text: 'Post number Two', comments_conter: 0, likes_counter: 0,
                           author: @user1)
      @post3 = Post.create(title: 'Third Post', text: 'Post number Three', comments_conter: 0, likes_counter: 0,
                           author: @user1)
      @post4 = Post.create(title: 'Fourth Post', text: 'Post number Four', comments_conter: 0, likes_counter: 0,
                           author: @user1)

      visit user_path(@user1.id)
    end

    it "show user's profile picture" do
      all('img').each do |i|
        expect(i[:src]).to eq('Tom.png')
      end
    end

    it "show user's name" do
      expect(page).to have_content 'Henry'
    end

    it 'I can see the number of posts the user has written.' do
      expect(page).to have_css('//h3', text: @user2.posts_counter)
    end

    it "show user's bio." do
      expect(page).to have_content('bio')
    end

    it "show user's first 3 posts." do
      expect(page).to have_content 'Post number Four'
      expect(page).to have_content 'Post number Three'
      expect(page).to have_content 'Post number Two'
    end

    it "show button that lets me view all of a user's posts." do
      expect(page).to have_link('See all posts')
    end

    it "click post and redirect to that post's show page." do
      click_link 'See all posts'
      expect(page).to have_current_path user_posts_path(@user1)
    end
  end
end
