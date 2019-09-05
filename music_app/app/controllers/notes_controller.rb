class NotesController < ApplicationController
  def new
    render :new
  end

  def create
    note = Note.new(note_params)
    note.track_id = params[:track_id]
    note.user_id = self.current_user.id
    note.save
    redirect_to track_url(params[:track_id])
  end

  def destroy
    note = Note.find(params[:id])
    note.destroy
    redirect_to track_url(params[:track_id])
  end

private
def note_params
  params.require(:note).permit(:body)
end

end