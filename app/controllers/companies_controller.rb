# frozen_string_literal: true

class CompaniesController < InertiaController
  include Filterameter::DeclarativeFilters
  include Pagy::Backend

  default_sort name: :asc

  filter :name, partial: true
  filter :continent, name: :slug, association: :continent
  filter :country, name: :slug, association: :country
  filter :region, name: :slug, association: :region
  filter :city, name: :slug, association: :city

  def index
    companies = build_query_from_filters(Company.with_all_associations)
    pagy, companies = pagy(companies)
    @companies = CompanySerializer.many(companies)
    @pagination = inertia_pagination(pagy)

    @filters = {
      name: filter_params[:name],
      continent: filter_params[:continent],
      country: filter_params[:country],
      region: filter_params[:region],
      city: filter_params[:city],
    }.compact_blank

    # TODO: Refactor into serializer/service
    countries = if filter_params[:continent]
      Country.includes(:continent).where(continent: { slug: filter_params[:continent] })
    else
      []
    end

    regions = if filter_params[:continent] && filter_params[:country]
      Region.includes(:country).where(country: { slug: filter_params[:country] })
    else
      []
    end

    cities = if filter_params[:continent] && filter_params[:country] && filter_params[:region]
      City.includes(:region).where(region: { slug: filter_params[:region] })
    else
      []
    end

    @options = {
      continents: Fragment::OptionSerializer.many(Continent.all),
      countries: Fragment::OptionSerializer.many(countries),
      regions: Fragment::OptionSerializer.many(regions),
      cities: Fragment::OptionSerializer.many(cities),
    }
  end

  def show
    company = Company.with_all_associations.friendly.find(params[:id])
    @company = CompanySerializer.one(company)
  end

  private

  def filter_params
    params.fetch(:filter, {})
  end
end
