require 'rails_helper'

describe "Profiles", type: :request do
  context "GET edit" do
    let(:user) { create(:user) }
    let(:edited_user) { User.last }

    before do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit edit_profile_path(user)
      fill_in "user_nick_name",              with: "sachin21edited"
      fill_in "user_bio",                    with: "edited bio"
      select User::INTERFACE_LANGUAGE[0][0], from: "user_language"
      click_button "submit-user"
    end

    it "should be success edit" do
      expect(edited_user.nick_name).to eq("sachin21edited")
      expect(edited_user.bio).to eq("edited bio")
      expect(edited_user.language).to eq("ja")
    end
  end
end
