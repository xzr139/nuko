# == Schema Information
#
# Table name: languages
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  name_jp        :string(255)
#  locale         :string(255)
#  interface_flag :boolean          default("0")
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'rails_helper'

describe Language, type: :model do
end
