# frozen_string_literal: true

module Fragment
  class GeoSerializer < ApplicationSerializer
    attributes(
      :id,
      :slug,
      :name,
    )
  end
end
