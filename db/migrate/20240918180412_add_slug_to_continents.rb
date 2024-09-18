# frozen_string_literal: true

class AddSlugToContinents < ActiveRecord::Migration[7.2]
  def up
    add_column(:continents, :slug, :string)

    Continent.reset_column_information
    Continent.find_each do |continent|
      continent.send(:set_slug)
      continent.save(validate: false)
    end

    add_index(:continents, :slug, unique: true)
    change_column_null(:continents, :slug, false)
  end

  def down
    remove_index(:continents, :slug)
    remove_column(:continents, :slug)
  end
end
