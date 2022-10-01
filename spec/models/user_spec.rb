require_relative '../rails_helper.rb'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.create(
      name: 'Henry',
      photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
      bio: 'Software Developer',
      post_counter: 0
    )
  end

  context 'with invalid values' do
    it 'title should be present' do
      @user.name = nil
      expect(@user).to_not be_valid
    end

    it 'PostCounter must be an integer greater than or equal to zero' do
      @user.post_counter = nil
      expect(@user).to_not be_valid
    end
  end
end