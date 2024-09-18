# frozen_string_literal: true

class AddSlugToCompanies < ActiveRecord::Migration[7.2]
  def up
    add_column(:companies, :slug, :string)

    Company.reset_column_information
    Company.find_each do |company|
      company.send(:set_slug)
      company.save(validate: false)
    end

    add_index(:companies, :slug, unique: true)
    change_column_null(:companies, :slug, false)
  end

  def down
    remove_index(:companies, :slug)
    remove_column(:companies, :slug)
  end
end
