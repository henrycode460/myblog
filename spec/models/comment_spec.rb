require 'rails_helper'

RSpec.describe Comment, type: :model do
  context 'Associations between the tables' do
    it { belong_to(:user) }
    it {  belong_to(:post) }
  end
end