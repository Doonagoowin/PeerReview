class Api::CohortsController < ApplicationController
  # Read
  def index
    render json: Cohort.all
  end

  # create
  def create
    @cohort = Cohort.new(item_params)
    if @cohort.save
      render json: @cohort
    else
      render json: { errors: @cohort.errors }, status: :unprocessable_entity
    end
  end

  # update
  def update
    if @cohort.update(item_params)
      render json: @cohort
    else
      render json: { errors: @cohort.errors }, status: :unprocessable_entity
    end
    
  end

  #delete
  def destroy
    Cohort.find(params[:id]).destroy
    render json:  { message: 'cohort is deleted'}
  end

  private
    def item_params
      params.require(:cohort).permit(:class_name)
    end
end
