# frozen_string_literal: true

class CompanySerializer < Oj::Serializer
  attributes :id,
    :name,
    :website,
    :created_at,
    :updated_at
end
