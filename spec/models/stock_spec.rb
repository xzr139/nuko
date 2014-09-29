# == Schema Information
#
# Table name: stocks
#
#  id         :integer          not null, primary key
#  note_id    :integer          not null
#  user_id    :integer          not null
#  stocked    :boolean          default(FALSE)
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Stock, type: :model do
end
