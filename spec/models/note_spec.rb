# == Schema Information
#
# Table name: notes
#
#  id             :integer          not null, primary key
#  title          :string(255)
#  content        :text(65535)
#  user_id        :integer
#  created_at     :datetime
#  updated_at     :datetime
#  deleted_at     :datetime
#  comments_count :integer          default(0), not null
#  stock_count    :integer          default(0)
#
# Indexes
#
#  index_notes_on_user_id  (user_id)
#

require 'rails_helper'

describe Note, type: :model do
  let(:user) { User.last }
  let(:note) { create(:note) }
  subject { note.stocked_by?(user) }

  context 'when stocks is not exists' do
    it { is_expected.to eq false }
  end

  context 'when stocks is exists' do
    before { create(:stock, note: note, user: note.user, stocked: true) }

    it { is_expected.to eq true }
  end
end
