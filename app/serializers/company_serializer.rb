# frozen_string_literal: true

class CompanySerializer < ApplicationSerializer
  include Rails.application.routes.url_helpers

  attributes(
    :id,
    :slug,
    :name,
    :website,
    :careers_page,
    :description,
  )

  attribute :address do
    {
      short: short_address,
      medium: medium_address,
      full: full_address,
    }
  end

  attribute :logo_url do
    return unless company&.logo&.attached?

    rails_representation_url(company.logo.variant(resize_to_fit: [100, 100]).processed, only_path: true)
  end

  has_many :technologies, serializer: TechnologySerializer
  has_one :continent, serializer: GeoFragmentSerializer
  has_one :country, serializer: GeoFragmentSerializer
  has_one :region, serializer: GeoFragmentSerializer
  has_one :city, serializer: GeoFragmentSerializer

  private

  def short_address
    [company.city&.name, company.country&.name].compact.join(", ")
  end

  def medium_address
    [company.city&.name, company.region&.name, company.country&.name].compact.join(", ")
  end

  def full_address
    [company.city&.name, company.region&.name, company.country&.name, company.continent&.name].compact.join(", ")
  end
end
