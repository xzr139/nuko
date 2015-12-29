require 'qiita/markdown'

class QiitaMarkdownService
  def initialize
    @processor = Qiita::Markdown::Processor.new
  end

  def exec(markdown)
    @processor.call(markdown)[:output].to_s.html_safe
  end
end
