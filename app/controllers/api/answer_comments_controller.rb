class Api::AnswerCommentsController < ApplicationController
  before_action :set_answer
  before_action :set_answercomment [:update, :destroy]
  def index
    @answerscomment = @answer.answercomments
    render json: @answercomments
  end

  def create
    @answercomment = @answer.answercomment.new(answercomment_params)
    if @answercomment.save
      render json: @answercomment
    else
      render json: { errors: @answercomment.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @answercomment.update(answercomment_params)
      render json: @answercomment
    else
      render json: { errors: @answercomment.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @answercomment.find(params[:id]).destroy
    render json:  { message: 'Comment has been deleted'}
  end
  
  private
  def answercomment_params
    params.require(:answercomment).permit(:body, :answer_id)
  end

  def set_answer
    @answer = Answer.find(params[:answer_id])
  end

  def set_answercomment
    @answercomment = AnswerComment.find(params[:id])
  end

end
