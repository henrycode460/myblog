class PostsController < ApplicationController
  load_and_authorize_resource

  def index
    @user = User.find_by(id: params[:user_id].to_i)
    @posts = @user.posts.includes(:comments)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    @user = current_user
    @user.posts_counter -= 1
    @user.save

    respond_to do |format|
      format.html { redirect_to(user_posts_url) }
    end
  end

  def new
    @user = current_user
  end

  def post_params
    params
      .require(:post)
      .permit(:title, :text)
      .merge(author: current_user, comments_conter: 0, likes_counter: 0)
  end

  def create
    @post = Post.new(post_params)
    respond_to do |format|
      format.html do
        if @post.save
          flash[:success] = 'Post saved successfully'
          redirect_to user_post_path(current_user, @post)
        else
          flash.now[:error] = 'Error: Post could not be saved'
          redirect_to new_user_post_path(current_user)
        end
      end
    end
  end

  def show
    @post = Post.find_by(id: params[:id].to_i)
    @user = User.find_by(id: params[:user_id].to_i)
    @comments = Comment.where(post_id: params[:id].to_i)
  end
end
