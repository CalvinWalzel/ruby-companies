# frozen_string_literal: true

FactoryBot.define do
  factory :company do
    name { "Pixelhub" }
    website { "https://pixelhub.nl" }
    city
  end
end
