# frozen_string_literal: true

FactoryBot.define do
  factory :technology do
    sequence(:name) { |i| "Technology #{i}" }
  end
end
