# frozen_string_literal: true

class GeoFragmentSerializer < ApplicationSerializer
  attributes(
    :id,
    :slug,
    :name,
  )
end
