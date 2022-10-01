require_relative '../rails_helper'

RSpec.describe Post, type: :model do
  before(:each) do
    @user = User.create(
      name: 'Henry',
      photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
      bio: 'Software Developer',
      post_counter: 0
    )
    @post = Post.create(
      author: @user,
      title: 'Dokin',
      text: 'Post for my status',
      commentscounter: 0,
      likescounter: 0
    )
  end

  context 'invalid inputs' do
    it 'is inavlid when Title is blank' do
      @post.title = nil
      expect(@post).to_not be_valid
    end

    it 'is invalid when :title length > 250' do
      @post.title = 'g' * 251
      expect(@post).to_not be_valid
    end

    it 'comment counter should be greater than or equal to zero' do
      @post.commentscounter = 'try'
      expect(@post).to_not be_valid
    end

    it 'like counter should be greater than or equal to zero' do
      @post.likescounter = 'try'
      expect(@post).to_not be_valid
    end
  end

  context 'methods the check for comments and like increament' do
    it 'calling the post_counter increases the postcounter by 1' do
      @user.post_counter = 1
      @post.update_user_posts_count
      expect(@user.post_counter).to eq(2)
    end
  end
end
