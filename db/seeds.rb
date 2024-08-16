# frozen_string_literal: true

return unless Rails.env.development?

require "faker"

class Seeder
  class << self
    def perform
      seed_companies
    end

    def seed_companies
      Company.destroy_all

      Company.create!(name: "Pixelhub", website: "https://pixelhub.nl")
      Company.create!(
        name: "AvoHQ",
        website: "https://avohq.io",
        description: "Avo is a very custom Admin Panel Framework, Content Management System,
        and Internal Tool Builder for Ruby on Rails that saves engineers and teams months of development time.",
      )

      create_records(Company, 48) do |i|
        {
          name: "Company #{i}",
          website: "about:blank",
          careers_page: "about:blank",
          description: "Welcome to the page of Company #{i}. We are a company that does things.",
        }
      end
    end

    private

    def create_records(model, count, &block)
      record_data = Array.new(count, &block)
      model.insert_all!(record_data)
    end
  end
end

Seeder.perform
