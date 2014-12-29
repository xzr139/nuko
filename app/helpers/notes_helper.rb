module NotesHelper
  def title
    if (params['controller'] == 'notes' || params['controller'] == 'comments') && params['id'].present? && @note
      @note.title ? @note.title : Settings.service.name
    else
      Settings.service.name
    end
  end
end
