User.create! do |user|
  user.facebook_id = 733146856734192
  user.email = 'bmxpapi@gmail.com'
  user.password = 'hogehoge12345'
  user.full_name = 'Hoge Fuga Foo'
  user.nick_name = 'foofuga'
  user.token = Base64.encode64('This is test token').chomp
  user.bio = 'hogeehoeee'
  user.language = 'ja'
end unless User.exists?(facebook_id: 733146856734192)
