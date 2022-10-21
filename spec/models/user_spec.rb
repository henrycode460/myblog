require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.') }

  before { subject.save }

  it 'Name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'Posts Counter attribute should be an integer' do
    subject.posts_counter = 'string'
    expect(subject).to_not be_valid
  end

  it 'Posts Counter attribute should be greater or equal to zero' do
    subject.posts_counter = -100
    expect(subject).to_not be_valid
  end
end
