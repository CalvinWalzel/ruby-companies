# frozen_string_literal: true

class CompaniesController < InertiaController
  include Filterameter::DeclarativeFilters
  include Pagy::Backend

  default_sort name: :asc

  filter :name, partial: true
  filter :city, name: :id, association: :city
  filter :region, name: :id, association: :region
  filter :country, name: :id, association: :country
  filter :continent, name: :id, association: :continent

  def index
    companies = build_query_from_filters(Company.with_all_associations)
    pagy, companies = pagy(companies)
    @companies = CompanySerializer.many(companies)
    @pagination = inertia_pagination(pagy)
  end

  def show
    company = Company.with_all_associations.friendly.find(params[:id])
    @company = CompanySerializer.one(company)
  end
end
