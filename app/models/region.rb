# frozen_string_literal: true

class Region < ApplicationRecord
  extend FriendlyId

  friendly_id :name, use: :slugged

  has_many :cities
  belongs_to :country
  has_one :continent, through: :country
  has_many :companies, through: :cities

  validates :name, presence: true
  validates :slug, presence: true
end
