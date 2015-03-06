# == Schema Information
#
# Table name: tags
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  taggings_count :integer          default("0")
#
# Indexes
#
#  index_tags_on_name  (name) UNIQUE
#

FactoryGirl.define do
  factory :tag, class: 'Tag' do
    sequence(:name) { |n| "content#{n}" }
  end
end
