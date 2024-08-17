# frozen_string_literal: true

class CompanySerializer < ApplicationSerializer
  attributes :id,
    :name,
    :website,
    :careers_page,
    :description

  has_many :technologies, serializer: TechnologySerializer
end
