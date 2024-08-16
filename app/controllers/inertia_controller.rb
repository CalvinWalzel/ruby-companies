# frozen_string_literal: true

class InertiaController < ApplicationController
  use_inertia_instance_props

  after_action :set_default_inertia_rendering

  private

  def set_default_inertia_rendering
    inertia_render(inertia: true) unless performed?
  end

  def paginate(pagy)
    pagination = pagy_metadata(pagy)
    @pagination = PaginationSerializer.render(pagination)
  end
end
