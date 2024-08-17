# frozen_string_literal: true

class CompaniesController < InertiaController
  include Pagy::Backend

  def index
    pagy, companies = pagy(Company.includes(:technologies).all)
    @companies = CompanySerializer.many(companies)

    paginate(pagy)
  end

  def show
    company = Company.includes(:technologies).find(params[:id])
    @company = CompanySerializer.one(company)
  end
end
