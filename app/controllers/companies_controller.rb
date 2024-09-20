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

    @filters = filter_params.slice(:name, :continent, :country, :region, :city).compact_blank
    @options = CompanyOptionsSerializer.render(filter_params)
  end

  def show
    company = Company.with_all_associations.friendly.find(params[:id])
    @company = CompanySerializer.one(company)
  end

  private

  def filter_params
    params.fetch(:filter, {}).permit(:name, :continent, :country, :region, :city)
  end
end
