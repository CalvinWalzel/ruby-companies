# frozen_string_literal: true

class CreateContinents < ActiveRecord::Migration[7.2]
  def change
    create_table(:continents) do |t|
      t.string(:name, null: false)

      t.timestamps
    end
  end
end
