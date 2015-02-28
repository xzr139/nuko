module LanguagesHelper
  def language_selector
    @@languages ||= Language.pluck(:name, :locale)
    @@languages
  end
end
