require './spec/rails_helper'

describe UsersController, type: :request do
  describe "'./index' page" do
    before :each do
      @link = get users_path
      get users_path
    end

    it 'Response value is 200' do
      expect(@link).to eql(200)
    end

    it 'Renders a correct template' do
      expect(response).to render_template('users/index')
    end

    it 'Has the correct placeholder text' do
      expect(response.body).to include('This is the list of our users and number of post')
    end
  end

  describe "'/show' page" do
    before :each do
      @link = get '/users/show'
      get '/users/show'
    end

    it 'Response value is 200' do
      expect(@link).to eql(200)
    end

    it 'Renders a correct template' do
      expect(response).to render_template('users/show')
    end

    it 'Has the correct placeholder text' do
      expect(response.body).to include('This is an individual user information')
    end
  end
end
