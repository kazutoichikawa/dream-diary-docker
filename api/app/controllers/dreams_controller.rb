class DreamsController < ApplicationController
  def index
    dreams = Dream.all.order(created_at: :desc)
    render json: dreams
  end

  def create
    @dream = Dream.new(dream_params)
    if @dream.save
      head :no_content
    else
      render json: @dream.errors, status: :unprocessable_entity
    end
  end

  private
  def dream_params
    params.fetch(:dream).permit(:title, :discription, :date)
  end
end
