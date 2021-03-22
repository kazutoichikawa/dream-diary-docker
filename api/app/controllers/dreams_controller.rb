class DreamsController < ApplicationController
  def index
  end

  def create
  end

  private
  def dream_params	
    params.require(:dream)
  end
end
