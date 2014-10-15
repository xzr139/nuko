# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  note_id    :integer          not null
#  content    :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#

require "spec_helper"

describe Comment, type: :model do
end
