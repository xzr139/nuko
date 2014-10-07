require 'spec_helper'

IMG_TAG_MIN =
  "<img alt=\"icon\" class=\"changeable-size-image\" height=\"20\" src=\"/images/default_image.png\" width=\"20\" />"
IMG_TAG_BIG =
  "<img alt=\"icon\" class=\"changeable-size-image\" height=\"30\" src=\"/images/default_image.png\" width=\"30\" />"

describe UsersHelper, type: :helper do
  context 'helper methods testing' do
    let!(:user) { create(:user) }
    let(:image_tag) { IMG_TAG_BIG }
    let(:variability_size_image_tag) { IMG_TAG_MIN }

    it 'should be the right value' do
      expect(helper.profile_image(user)).to eq(image_tag)
    end

    it 'should be return variability size image tag' do
      expect(helper.profile_image(user, '20x20')).to eq(variability_size_image_tag)
    end
  end
end
