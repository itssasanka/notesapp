class NotesController < ApplicationController
  def create
    verify_params(%w(title content tags))

    tags = params[:tags].map{|t| Tag.find_or_create_by(name: t)}
    Note.create(:title => params[:title], :content => params[:content], :tags => tags)
    render :nothing, :status => :created
  end

  def index
    if params[:tag_id].present?
      notes = Tag.find(params[:tag_id]).notes
    else
      notes = Note.all
    end

    render json: notes, include: {tags: {except:[:created_at, :updated_at]}}, status: :ok
  end

  def destroy
    verify_params('id')
    Note.find(params[:id]).destroy
    render :nothing, :status => :ok
  end

  def edit
    verify_params(%w(title content tags))
    note = Note.find(params[:id])
    note.update_attributes(:title => params[:title], :content => params[:content], :tags => tags)
  end
end
