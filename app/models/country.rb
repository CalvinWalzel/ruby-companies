# frozen_string_literal: true

class Country < ApplicationRecord
  extend FriendlyId

  friendly_id :name, use: :slugged

  belongs_to :continent
  has_many :regions
  has_many :cities, through: :regions
  has_many :companies, through: :cities

  validates :name, presence: true
  validates :slug, presence: true
end
