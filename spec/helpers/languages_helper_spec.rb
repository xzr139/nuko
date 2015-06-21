require 'rails_helper'

describe LanguagesHelper, type: :helper do
  describe "#language_selector" do
    it "returns same value" do
      expect(helper.language_selector).to eq(Language.pluck(:name, :locale))
    end
  end
end
