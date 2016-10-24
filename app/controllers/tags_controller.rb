class TagsController < ApplicationController
  def index
    verify_params('term')

    tags = Tag.where('name LIKE ?', "%#{params[:term]}%")
    render json: tags, status: :ok
  end
end