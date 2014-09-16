module NoteDecorator
  def is_this_my_note?
    Note.find_by(id: id).user == current_user
  end
end
