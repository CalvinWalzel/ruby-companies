# frozen_string_literal: true

class AddSlugToCountries < ActiveRecord::Migration[7.2]
  def up
    add_column(:countries, :slug, :string)

    Country.reset_column_information
    Country.find_each do |country|
      country.send(:set_slug)
      country.save(validate: false)
    end

    add_index(:countries, :slug, unique: true)
    change_column_null(:countries, :slug, false)
  end

  def down
    remove_index(:countries, :slug)
    remove_column(:countries, :slug)
  end
end
