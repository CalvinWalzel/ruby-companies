# frozen_string_literal: true

class CreateCompanies < ActiveRecord::Migration[7.1]
  def change
    create_table(:companies) do |t|
      t.string(:name, null: false)
      t.string(:website)

      t.timestamps
    end
  end
end
