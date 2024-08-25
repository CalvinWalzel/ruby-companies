# frozen_string_literal: true

class Region < ApplicationRecord
  has_many :cities
  belongs_to :country
  has_one :continent, through: :country
  has_many :companies, through: :cities

  validates :name, presence: true
end
