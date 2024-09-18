# frozen_string_literal: true

class CompaniesController < InertiaController
  include Pagy::Backend

  def index
    pagy, companies = pagy(company_scope.all)
    @companies = CompanySerializer.many(companies)

    paginate(pagy)
  end

  def show
    company = company_scope.friendly.find(params[:id])
    @company = CompanySerializer.one(company)
  end

  private

  def company_scope
    Company.includes(:technologies, :continent, :country, :region, :city)
  end
end
