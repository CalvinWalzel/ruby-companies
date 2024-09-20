# frozen_string_literal: true

module Fragment
  class OptionSerializer < ApplicationSerializer
    attributes(
      name: :label,
      slug: :value,
    )
  end
end
