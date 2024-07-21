# frozen_string_literal: true

require "rails_helper"

RSpec.describe(Company, type: :model) do
  require_factories

  let(:company) { create(:company) }

  it "validates name presence" do
    company.name = nil
    expect(company).to_not(be_valid)
  end

  it "validates website presence" do
    company.website = nil
    expect(company).to_not(be_valid)
  end

  it "validates website structure" do
    company.website = "invalid"
    expect(company).to_not(be_valid)
  end
end
