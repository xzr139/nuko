module ApplicationHelper
  MARKDOWN_CONFIG = {
    autolink: true,
    space_after_headers: true,
    no_intra_emphasis: true,
    fenced_code_blocks: true,
    tables: true,
    hard_wrap: true,
    xhtml: true,
    lax_html_blocks: true,
    strikethrough: true
  }

  def markdown(text)
    markdown = Redcarpet::Markdown.new Redcarpet::Render::HTML, MARKDOWN_CONFIG
    markdown.render(text).html_safe
  end

  def simple_pluralize(count, singular, plural = nil)
    if locale == :en
      ((count == 1 || count =~ /^1(\.0+)?$/) ? singular : (plural || singular.pluralize))
    else
      singular
    end
  end
end
