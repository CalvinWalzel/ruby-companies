# frozen_string_literal: true

class AddCareersPageAndDescriptionToCompanies < ActiveRecord::Migration[7.1]
  def change
    add_column(:companies, :careers_page, :string)
    add_column(:companies, :description, :text)
  end
end
