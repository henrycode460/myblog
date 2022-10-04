class UsersController < ApplicationController
  def index
    puts params[:user_posts]
  end

  def show
    puts params[:id]
  end
end
