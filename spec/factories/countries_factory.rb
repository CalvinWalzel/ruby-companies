# frozen_string_literal: true

FactoryBot.define do
  factory :country do
    name { "Netherlands" }
    continent
  end
end
