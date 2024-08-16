# frozen_string_literal: true

class InertiaController < ApplicationController
  def paginate(pagy)
    pagination = pagy_metadata(pagy)
    @pagination = PaginationSerializer.render(pagination)
  end
end
