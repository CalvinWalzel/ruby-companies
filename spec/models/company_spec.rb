# frozen_string_literal: true

require "rails_helper"

RSpec.describe(Company, type: :model) do
  require_shoulda_matchers

  describe "validations" do
    it { is_expected.to(validate_presence_of(:name)) }

    context "website" do
      it { is_expected.to(validate_url_of(:website)) }
      it { is_expected.to(allow_values("https://pixelhub.nl").for(:website)) }
      it { is_expected.to_not(allow_values(nil, "", "http://localhost", "https://pixelhub.invalid").for(:website)) }
    end

    context "careers_page" do
      it { is_expected.to(validate_url_of(:careers_page)) }
      it { is_expected.to(allow_values(nil, "", "https://pixelhub.nl").for(:careers_page)) }
      it { is_expected.to_not(allow_values("http://localhost", "https://pixelhub.invalid").for(:careers_page)) }
    end
  end
end
