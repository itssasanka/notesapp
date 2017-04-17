class TagsController < ApplicationController
  def create
    verify_params('name')

    Tag.create(name: params[:name])
    render :nothing, status: :created
  end

  def index
    render json: Tag.all, status: :ok
  end

  def show
    verify_params(:id)
    tag = Tag.find(params[:id])
    render json: tag, status: :ok
  end
end