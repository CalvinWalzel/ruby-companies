# frozen_string_literal: true

class CompanyOptionsSerializer < Oj::Serializer
  object_as :filter_params

  has_many :continents, serializer: Fragment::OptionSerializer do
    Continent.all
  end

  has_many :countries, serializer: Fragment::OptionSerializer do
    if filter_params[:continent]
      Country.includes(:continent).where(continent: { slug: filter_params[:continent] })
    else
      []
    end
  end

  has_many :regions, serializer: Fragment::OptionSerializer do
    if filter_params[:continent] && filter_params[:country]
      Region.includes(:country).where(country: { slug: filter_params[:country] })
    else
      []
    end
  end

  has_many :cities, serializer: Fragment::OptionSerializer do
    if filter_params[:continent] && filter_params[:country] && filter_params[:region]
      City.includes(:region).where(region: { slug: filter_params[:region] })
    else
      []
    end
  end
end
