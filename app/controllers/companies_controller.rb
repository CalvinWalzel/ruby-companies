# frozen_string_literal: true

class CompaniesController < InertiaController
  include Pagy::Backend

  def index
    pagy, companies = pagy(Company.all)
    @companies = CompanySerializer.many(companies)

    paginate(pagy)
  end

  def show
    company = Company.find(params[:id])
    @company = CompanySerializer.one(company)
  end
end
