# frozen_string_literal: true
# typed: strict

class Company < ApplicationRecord
  validates :name, presence: true
  validate :validate_url

  def validate_url
    return if website.nil?
    return if PublicSuffix.valid?(website, default_rule: nil)

    errors.add(:website, :valid_url)
  end
end
