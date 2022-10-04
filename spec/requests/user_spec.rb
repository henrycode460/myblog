require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /Posts' do
    it 'returns http success' do
      get '/user/Posts'
      expect(response).to have_http_status(:success)
    end
  end
end
