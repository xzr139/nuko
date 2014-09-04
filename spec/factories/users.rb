# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    facebook_id 733146856734194
    email "sachin21.developer@gmail.com"
    full_name "Satoshi Sachin Ohmori"
    nick_name "sachin21"
    token "xxxxxxxxxxxxxxxxxx"
    company "Lang-8"
    bio "アメリカに留学している大森です。英語を勉強しています。趣味は映画鑑賞とブログを読むことです。よろしくお願いします。"
  end
end
