require 'rails_helper'

RSpec.describe Like, type: :model do
  context 'Association between the tables' do
     it { belong_to(:user) }
     it { belong_to(:post) }
  end
end