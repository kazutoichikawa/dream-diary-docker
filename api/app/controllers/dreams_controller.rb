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

  def destroy
    @dream = Dream.find(params[:id])
    if @dream.destroy
      head :no_content
    else
      render json: @dream.errors, status: :unprocessable_entity
    end
  end

  def update
    @dream = Dream.find(params[:id])
    if @dream.update(dream_params)
      render json: { status: 'SUCCESS', message: 'Updated the post', data: @dream }
    else
      render json: { status: 'SUCCESS', message: 'Not updated', data: @dream.errors }
    end

  end

  private
  def dream_params
    params.fetch(:dream).permit(:title, :discription)
  end
end
