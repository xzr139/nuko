module NoteDecorator
  def is_this_my_note?
    self.user == current_user
  end
end
