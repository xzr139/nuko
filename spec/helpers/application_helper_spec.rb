require "spec_helper"

describe ApplicationHelper do
  before do
    I18n.locale = "en"
  end

  it "should return plural" do
    expect(helper.simple_pluralize(0, "comment")).to eql("comments")
  end

  it "should return singular" do
    expect(helper.simple_pluralize(1, "comment")).to eql("comment")
  end
end
