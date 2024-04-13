# frozen_string_literal: true

class HomeController < ApplicationController
  use_inertia_instance_props

  def show
    @name = "World"
  end
end
