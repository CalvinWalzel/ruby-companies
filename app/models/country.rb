# frozen_string_literal: true

class Country < ApplicationRecord
  belongs_to :continent
  has_many :regions
  has_many :cities, through: :regions
  has_many :companies, through: :cities

  validates :name, presence: true
end
