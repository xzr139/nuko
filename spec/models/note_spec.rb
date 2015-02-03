# == Schema Information
#
# Table name: notes
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  content    :text(65535)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#  deleted_at :datetime
#

require 'spec_helper'

describe Note, type: :model do
  let(:note) { create(:note) }
  let(:user) { User.last }

  it "should return false, because none stock" do
    expect(note.stocked_by?(user)).to eq(false)
  end

  it "should return true, because exist stock" do
    note.user.stocks.build(note_id: note.id, stocked: true).save
    expect(note.stocked_by?(user)).to eq(true)
  end
end
