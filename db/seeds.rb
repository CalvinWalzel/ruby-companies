# frozen_string_literal: true

require "faker"

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Company.destroy_all

companies = Array.new(50) do
  {
    name: Faker::Company.name,
    website: "#{Faker::Internet.domain_word}.com",
    introduction: Faker::Lorem
      .paragraphs(number: rand(0..4))
      .presence
      &.join("\n"),
  }
end

companies.each { |c| Company.create!(c) }
