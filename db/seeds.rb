require 'csv'

ActiveRecord::Base.connection.execute("TRUNCATE languages")

unless Rails.env.test?
  TAGS = [
    %w( シェアハウス 人間関係 場所 ),
    %w( カラオケ  ジュース うるさい ),
    %w( ジャンプ 駅 すごい ),
    %w( TV ゲーム 家で ),
    %w( 電車 駅 公園で )
  ]

  20.times do |i|
    note = User.first.notes.build
    note.title = 'title' + i.to_s
    note.tag_list = TAGS[rand(TAGS.length)]
    note.content = 'content' + i.to_s
    note.save
  end

  unless User.exists?(facebook_id: 733146856734192)
    user = User.new
    user.facebook_id = 733146856734192
    user.email = 'bmxpapi@gmail.com'
    user.full_name = 'Hoge Fuga Foo'
    user.nick_name = 'Hoge Fuga Foo'
    user.token = 'JIEFJIEJF'
    user.bio = 'hogeehoeee'
    user.language = 'ja'
    user.save
  end
end

_header, *languages = CSV.read(Rails.root.join("db", "data", "languages.csv").to_s)

languages.each do |name, name_jp, locale, interface_flag|
  Language.create!(name: name, name_jp: name_jp, locale: locale, interface_flag: interface_flag.present?)
end
