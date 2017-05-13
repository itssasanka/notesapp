class NotesController < ApplicationController
  def create
    verify_params(%w(title content))

    Note.create(
        title: params[:title],
        content: params[:content],
        tag_ids: params[:tag_ids]
    )
    render json: {ok: true}, status: :created
  end

  def index
    if params[:tag_id].present?
      notes = Tag.find(params[:tag_id]).notes
    else
      notes = Note.all
    end

    render json: notes, status: :ok
  end

  def show
      note = Note.find(params[:id])
      render json: note, status: :ok
  end

  def destroy
    Note.find(params[:id]).destroy
    render :nothing, :status => :ok
  end

  def edit
    verify_params(%w(title content))
    note = Note.find(params[:id])
    note.update_attributes(:title => params[:title], :content => params[:content], :tags => tags)
  end
end
