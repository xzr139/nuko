require "spec_helper"

describe ApplicationHelper do
  before do
    I18n.locale = "en"
  end

  it "returns word of plural" do
    expect(helper.simple_pluralize(0, "comment")).to eql("comments")
  end

  it "returns word of singular" do
    expect(helper.simple_pluralize(1, "comment")).to eql("comment")
  end
end
