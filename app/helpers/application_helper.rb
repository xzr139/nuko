module ApplicationHelper
  def simple_pluralize(count, singular, plural = nil)
    if locale == 'en' || locale == :en
      ((count == 1 || count =~ /^1(\.0+)?$/) ? singular : (plural || singular.pluralize))
    else
      singular
    end
  end

  def target_with_pluralize(count, sentence, target_word, plural = nil)
    if locale == 'en' || locale == :en
      sentence.gsub(target_word, ((count == 1 || count =~ /^1(\.0+)?$/) ? target_word : (plural || target_word.pluralize)))
    else
      sentence
    end
  end
end
