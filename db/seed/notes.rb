TAGS = [
  %w(シェアハウス 人間関係 場所),
  %w(カラオケ  ジュース うるさい),
  %w(ジャンプ 駅 すごい),
  %w(TV ゲーム 家で),
  %w( 電車 駅 公園で)
]

20.times do
  User.find_by(facebook_id: 733146856734194).notes.create! do |note|
    note_id = note.id.to_s

    note.title = 'title' + note_id
    note.tag_list = TAGS.sample.shuffle
    note.content = 'content' + note_id
  end
end if User.find_by(facebook_id: 733146856734194)
