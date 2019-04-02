class Api::AnswersController < ApplicationController
  def index
    render json: Answer.all 
  end

  def update
    @answer = Answer.find(params[:id])
    if @answer.update(answer_params)
      render json: @answer
    else
      render json: { errors: @answer.errors }
    end
  end

  def create
    @answer = Answer.new(answer_params)
    if @answer.save
      render json: @answer
    else
      render json: { errors: @answer.errors }
    end
  end

  def destroy
    Answer.find(params[:id]).destroy
    render json: { message: 'Answer got deleted' }
  end

  private 
    def answer_params
      params.require(:post).permit(:body)
    end

end
end
