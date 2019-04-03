class Api::PostCommentsController < ApplicationController
  before_action: :set_post

  #Read
  def index
    @postcomment = @post.postcomments
    render json: @postcomments
  end

  #Create
  def create
    @postcomment = @post.postcomment.new(postcomment_params)
    if @postcomment.save
      render json: @postcomment
    else
      render json: { errors: @postcomment.errors }, status: :unprocessable_entity
  end

  #update
  def update
    if @postcomment.update(postcomment_params)
      render json: @postcomment
    else
      render json: { errors: @postcomment.errors }, status: :unprocessable_entity
  end

  #delete
  def destroy
    @postcomment[:id].destroy
    render json: { message: 'comment is deleted' }
  end

  private
    def postcomment_params
      params.require(:postcomment).permit(:postcomment_id)
    end

    def set_post
      @post = Post.find(params[:post_id])
    end

end
