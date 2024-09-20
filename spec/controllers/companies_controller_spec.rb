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

    it "has a valid filter declaration" do
      expect(described_class.declarations_validator).to(be_valid)
    end

    it "applies filters" do
      create(:company, name: "Ruby Corp")
      create(:company, name: "Python Inc")

      get "/companies", params: { filter: { name: "Ruby" } }

      expect(inertia.props[:companies].length).to(eq(1))
      expect(inertia.props[:companies].first[:name]).to(eq("Ruby Corp"))
    end

    it "sorts companies by name in ascending order by default" do
      create(:company, name: "Zebra Tech")
      create(:company, name: "Aardvark Solutions")

      get "/companies"

      expect(inertia.props[:companies].first[:name]).to(eq("Aardvark Solutions"))
      expect(inertia.props[:companies].last[:name]).to(eq("Zebra Tech"))
    end

    it "includes pagination in the response" do
      create_list(:company, 5)

      get "/companies"

      expect(inertia.props[:pagination]).to(be_present)
    end

    it "includes company options in the response" do
      get "/companies"

      expect(inertia.props[:options]).to(be_present)
      expect(inertia.props[:options]).to(have_key(:continents))
      expect(inertia.props[:options]).to(have_key(:countries))
      expect(inertia.props[:options]).to(have_key(:regions))
      expect(inertia.props[:options]).to(have_key(:cities))
    end

    it "assigns compact filters" do
      get "/companies", params: { filter: { name: "Ruby", continent: "", country: "USA", region: nil, city: "  " } }

      expect(inertia.props[:filters].keys.count).to(eq(2))
      expect(inertia.props[:filters][:name]).to(eq("Ruby"))
      expect(inertia.props[:filters][:country]).to(eq("USA"))
    end
  end

  describe "#show", inertia: true do
    it "renders a company" do
      company = create(:company)

      get "/companies/#{company.slug}"

      expect_inertia.to(render_component("companies/show"))
      expect(inertia.props[:company]).to(be_serialized_one(company))
    end

    it "returns a 404 for non-existent company" do
      get "/companies/non-existent-slug"

      expect(response).to(have_http_status(:not_found))
    end
  end
end
