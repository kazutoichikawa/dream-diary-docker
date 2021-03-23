class DreamsController < ApplicationController
  def index
    @dreams = Dream.all.order(created_at: :desc)
  end

  def create
    @drams = DreamsTag.new(dream_params)
  end

  private
  def dream_params	
    params.require(:dreams_tag).permit(:title, :discription, :name)
  end
end
