# frozen_string_literal: true

class CompanySerializer < ApplicationSerializer
  attributes :id,
    :name,
    :website,
    :careers_page,
    :description
end
