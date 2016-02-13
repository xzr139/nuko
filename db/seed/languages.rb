require 'csv'

_header, *languages = CSV.read(Rails.root.join("db", "data", "languages.csv").to_s)

languages.each do |name, name_jp, locale, interface_flag|
  Language.create!(name: name, name_jp: name_jp, locale: locale, interface_flag: interface_flag.present?)
end
