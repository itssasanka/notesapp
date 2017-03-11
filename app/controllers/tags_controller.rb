class TagsController < ApplicationController
  def index
    render json: Tag.all, status: :ok
  end

  def show
      tag = Tag.find(params[:id])
      render json: tag, status: :ok
  end
end