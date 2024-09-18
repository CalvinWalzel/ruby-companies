# frozen_string_literal: true

require "rails_helper"

RSpec.describe(CompaniesController, type: :request) do
  require_factories
  require_inertia

  describe "#index", inertia: true do
    it "renders a list of companies" do
      companies = create_list(:company, 5)

      get "/companies"

      expect_inertia.to(render_component("companies/index"))
      expect(inertia.props[:companies]).to(be_serialized_many(companies))
    end
  end

  describe "#show", inertia: true do
    it "renders a company" do
      company = create(:company)

      get "/companies/#{company.slug}"

      expect_inertia.to(render_component("companies/show"))
      expect(inertia.props[:company]).to(be_serialized_one(company))
    end
  end
end
