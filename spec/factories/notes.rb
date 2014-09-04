# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :note do
    title "title"
    content "アメリカに留学している大森です。英語を勉強しています。趣味は映画鑑賞とブログを読むことです。よろしくお願いします。"
    user_id create(:user).id
  end
end
