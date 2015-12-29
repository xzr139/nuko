class Api::NotesController < ApiController
  def preview
    respond_to do |format|
      format.html { render html: QiitaMarkdownService.new.exec(params[:markdown]) }
    end
  end
end
