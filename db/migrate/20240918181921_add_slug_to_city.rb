# frozen_string_literal: true

class AddSlugToCity < ActiveRecord::Migration[7.2]
  def up
    add_column(:cities, :slug, :string)

    City.reset_column_information
    City.find_each do |city|
      city.send(:set_slug)
      city.save(validate: false)
    end

    add_index(:cities, :slug, unique: true)
    change_column_null(:cities, :slug, false)
  end

  def down
    remove_index(:cities, :slug)
    remove_column(:cities, :slug)
  end
end
