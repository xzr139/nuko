module ApplicationHelper
  def simple_pluralize(count, singular, plural=nil)
    if locale == :en
      ((count == 1 || count =~ /^1(\.0+)?$/) ? singular : (plural || singular.pluralize))
    else
      singular
    end
  end
end
