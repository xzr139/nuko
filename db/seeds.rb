# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
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
