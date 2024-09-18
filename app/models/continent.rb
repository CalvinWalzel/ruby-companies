# frozen_string_literal: true

class Continent < ApplicationRecord
  extend FriendlyId

  friendly_id :name, use: :slugged

  has_many :cities, through: :regions
  has_many :regions, through: :countries
  has_many :countries
  has_many :companies, through: :cities

  validates :name, presence: true
  validates :slug, presence: true
end
