# frozen_string_literal: true

return unless Rails.env.development?

require "faker"

class Seeder
  class << self
    def perform
      destroy_data!
      seed_technologies
      seed_companies
    end

    def destroy_data!
      CompanyTechnology.destroy_all
      Technology.destroy_all
      Company.destroy_all
    end

    def seed_technologies
      @ruby = Technology.create!(name: "Ruby", background_color: "#cc0000", text_color: "#ffffff")
      @rails = Technology.create!(name: "Ruby on Rails", background_color: "#cc0000", text_color: "#ffffff")
    end

    def seed_companies
      @company_1 = Company.create!(name: "Pixelhub", website: "https://pixelhub.nl", technologies: [@ruby, @rails])
      @company_2 = Company.create!(
        name: "AvoHQ",
        website: "https://avohq.io",
        description: "Avo is a very custom Admin Panel Framework, Content Management System,
        and Internal Tool Builder for Ruby on Rails that saves engineers and teams months of development time.",
        technologies: [@ruby, @rails],
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
