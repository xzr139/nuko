# == Schema Information
#
# Table name: languages
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  name_jp        :string(255)
#  locale         :string(255)
#  interface_flag :boolean          default(FALSE)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Language < ActiveRecord::Base
end
