class UserPostsController < ApplicationController
  def index; end

  def show
    puts params[:id]
  end
end