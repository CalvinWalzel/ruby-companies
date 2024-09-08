# frozen_string_literal: true

class AddCityToCompanies < ActiveRecord::Migration[7.2]
  def change
    add_reference(:companies, :city, null: false, foreign_key: true)
  end
end
