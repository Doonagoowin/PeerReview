class Api::AnswersController < ApplicationController
  before_action :set_post
  before_action :set_answer, only: [:update, :destroy]

  def index
    @answers = @post.answers
    render json: @answers
  end

  def update
    if @answers.update(answer_params)
      render json: @answer
    else
      render json: { errors: @answer.errors }
    end
  end

  def create
    @answer = @post.answers.new(answer_params)
    if @answer.save
      render json: @answer
    else
      render json: { errors: @answer.errors }
    end
  end

  def destroy
    @answers.destroy
    render json: { message: 'Answer got deleted' }
  end

  private 
    def answer_params
      params.require(:answer).permit(:body)
    end

    def set_post
      @post = Post.find(params[:post_id])
    end

    def set_answer
      @answer = Answer.find(params[:id])
    end

end
