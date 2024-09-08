# frozen_string_literal: true

class City < ApplicationRecord
  belongs_to :region
  has_one :country, through: :region
  has_one :continent, through: :country
  has_many :companies

  validates :name, presence: true
end
