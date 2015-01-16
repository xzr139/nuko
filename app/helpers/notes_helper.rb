module NotesHelper
  def title
    name = Settings.service.name

    if (params['controller'] == 'notes' || params['controller'] == 'comments') && params['id'].present? && @note
      @note.title ? "#{@note.title} - #{name}" : name
    elsif params['controller'] == 'profiles' && params['id'].present?
      User.find(params[:id]).nick_name + ' - ' + name
    else
      t("common.home", name: name)
    end
  end
end
