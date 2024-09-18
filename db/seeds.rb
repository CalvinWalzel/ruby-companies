# frozen_string_literal: true

return unless Rails.env.development?

require "faker"

class Seeder
  class << self
    def perform
      destroy_data!
      seed_geo_data
      seed_technologies
      seed_companies
    end

    def destroy_data!
      CompanyTechnology.destroy_all
      Technology.destroy_all
      Company.destroy_all
      City.destroy_all
      Country.destroy_all
      Region.destroy_all
      Continent.destroy_all
    end

    def seed_geo_data
      africa = Continent.create!(name: "Africa")
      asia = Continent.create!(name: "Asia")
      europe = Continent.create!(name: "Europe")
      north_america = Continent.create!(name: "North America")
      oceania = Continent.create!(name: "Oceania")
      south_america = Continent.create!(name: "South America")

      # Pixelhub
      netherlands = Country.create!(name: "The Netherlands", continent: europe)
      north_holland = Region.create!(name: "North Holland", country: netherlands)
      @amsterdam = City.create!(name: "Amsterdam", region: north_holland)

      # AvoHQ
      romania = Country.create!(name: "Romania", continent: europe)
      muntenia = Region.create!(name: "Muntenia", country: romania)
      @bucharest = City.create!(name: "Bucharest", region: muntenia)

      # Sample cities for companies
      kenya = Country.create!(name: "Kenya", continent: africa)
      nairobi_city = Region.create!(name: "Nairobi City", country: kenya)
      nairobi = City.create!(name: "Nairobi", region: nairobi_city)

      japan = Country.create!(name: "Japan", continent: asia)
      kanto = Region.create!(name: "Kanto", country: japan)
      tokyo = City.create!(name: "Tokyo", region: kanto)

      united_kingdom = Country.create!(name: "United Kingdom", continent: europe)
      greater_london = Region.create!(name: "Greater London", country: united_kingdom)
      london = City.create!(name: "London", region: greater_london)

      united_states = Country.create!(name: "United States", continent: north_america)
      new_york = Region.create!(name: "New York", country: united_states)
      new_york_city = City.create!(name: "New York City", region: new_york)

      australia = Country.create!(name: "Australia", continent: oceania)
      new_south_wales = Region.create!(name: "New South Wales", country: australia)
      sydney = City.create!(name: "Sydney", region: new_south_wales)

      brazil = Country.create!(name: "Brazil", continent: south_america)
      sao_paulo = Region.create!(name: "Sao Paulo", country: brazil)
      sao_paulo_city = City.create!(name: "Sao Paulo City", region: sao_paulo)

      @sample_cities = [nairobi, tokyo, london, new_york_city, sydney, sao_paulo_city]
    end

    def seed_technologies
      @ruby = Technology.create!(name: "Ruby", background_color: "#cc0000", text_color: "#ffffff")
      @rails = Technology.create!(name: "Ruby on Rails", background_color: "#cc0000", text_color: "#ffffff")
    end

    def seed_companies
      Company.create!(
        name: "Pixelhub",
        website: "https://pixelhub.nl",
        city: @amsterdam,
        technologies: [@ruby, @rails],
      )

      Company.create!(
        name: "AvoHQ",
        website: "https://avohq.io",
        description: "Avo is a very custom Admin Panel Framework, Content Management System,
        and Internal Tool Builder for Ruby on Rails that saves engineers and teams months of development time.",
        city: @bucharest,
        technologies: [@ruby, @rails],
      )

      create_records(Company, 48) do |i|
        {
          name: "Company #{i}",
          slug: "company-#{i}",
          website: "https://ruby-companies.org",
          careers_page: "https://ruby-companies.org",
          description: "Welcome to the page of Company #{i}. We are a company that does things.",
          city_id: @sample_cities.sample.id,
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
