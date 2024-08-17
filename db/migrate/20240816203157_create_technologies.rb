# frozen_string_literal: true

class CreateTechnologies < ActiveRecord::Migration[7.1]
  def change
    create_table(:technologies) do |t|
      t.string(:name, null: false, index: { unique: true })
      t.string(:background_color)
      t.string(:text_color)

      t.timestamps
    end
  end
end
