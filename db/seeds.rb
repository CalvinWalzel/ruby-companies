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

      Company.create(name: "Pixelhub", website: "https://pixelhub.nl")
      Company.create(name: "AvoHQ", website: "https://avohq.io")

      create_records(Company, 48) do |i|
        {
          name: "Company #{i}",
          website: "about:blank",
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
