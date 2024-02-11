# frozen_string_literal: true

class Company < ApplicationRecord
  validates :name, presence: true
  validate :valid_url

  def valid_url
    return if website.nil?
    return if PublicSuffix.valid?(website, default_rule: nil)

    errors.add(:website, :valid_url)
  end
end
