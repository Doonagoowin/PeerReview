class Api::PostsController < ApplicationController
  before_action :authenticate_user!, only: [:update, :create, :destroy]

  def index
    render json: Post.all 
  end

  def update
    @post = current_user.posts.find(params[:id])
    if current_user.posts.update(post_params)
      render json: @post
    else
      render json: { errors: @post.errors }
    end
  end

  def create
    @post = current_user.posts.new(post_params)
    if current_user.posts.save
      render json: @post
    else
      render json: { errors: @post.errors }
    end
  end

  def destroy
    current_user.posts.find(params[:id]).destroy
    render json: { message: 'Post got deleted' }
  end

  private 
    def post_params
      params.require(:post).permit(:title, :body)
    end
end
