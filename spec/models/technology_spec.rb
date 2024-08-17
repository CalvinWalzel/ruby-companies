# frozen_string_literal: true

require "rails_helper"

RSpec.describe(Technology, type: :model) do
  require_factories
  require_shoulda_matchers

  describe "validations" do
    subject { build(:technology) }

    it { is_expected.to(validate_presence_of(:name)) }
    it { is_expected.to(validate_uniqueness_of(:name)) }

    it "returns a validation error if background_color is not a valid hex color code" do
      technology = build(:technology, background_color: "invalid")
      expect(technology).to_not(be_valid)
      expect(technology.errors[:background_color]).to(be_present)
    end

    it "returns a validation error if text_color is not a valid hex color code" do
      technology = build(:technology, text_color: "invalid")
      expect(technology).to_not(be_valid)
      expect(technology.errors[:text_color]).to(be_present)
    end
  end
end
