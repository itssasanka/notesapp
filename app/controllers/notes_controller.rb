class NotesController < ApplicationController
  def create
    verify_params(%w(title content tag))
    Note.create(create_params)
    render :nothing, :status => :created
  end


end
