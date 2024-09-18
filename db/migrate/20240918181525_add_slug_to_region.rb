# frozen_string_literal: true

class AddSlugToRegion < ActiveRecord::Migration[7.2]
  def up
    add_column(:regions, :slug, :string)

    Region.reset_column_information
    Region.find_each do |region|
      region.send(:set_slug)
      region.save(validate: false)
    end

    add_index(:regions, :slug, unique: true)
    change_column_null(:regions, :slug, false)
  end

  def down
    remove_index(:regions, :slug)
    remove_column(:regions, :slug)
  end
end
