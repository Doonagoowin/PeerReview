class Api::TagsController < ApplicationController
  before_action :set_post
  before_action :set_tag, only: [:update, :destroy]
  
  # Read
   def index
    @tags = @post.tags
    render json: @tags
  end

  # create
  def create
    @tag = @post.tags.new(tag_params)
    if @tag.save
      render json: @tag
    else
      render json: { errors: @tag.errors }, status: :unprocessable_entity
    end
  end

  # update
  def update
    if @tag.update(tag_params)
      render json: @tag
    else
      render json: { errors: @tag.errors }, status: :unprocessable_entity
    end
    
  end

  #delete
  def destroy
    @tag.destroy
    render json:  { message: 'tag is deleted'}
  end

  private
    def tag_params
      params.require(:tag).permit(:tag_name)
    end

    def set_post
      @post = Post.find(params[:post_id])
    end

    def set_tag
      @tag = Tag.find(params[:id])
    end
end
