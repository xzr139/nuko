module MarkdownHelper
  def markdown(content)
    QiitaMarkdownService.new.exec(content)
  end
end
