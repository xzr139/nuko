module NoteDecorator
  def this_my_note?
    user == current_user
  end

  def only_page?
    (params['controller'] == 'notes' || params['controller'] == 'comments') && params['id'].present?
  end
end
