# frozen_string_literal: true
# typed: strict

class Company < ApplicationRecord
  extend FriendlyId

  friendly_id :slug_candidates, use: [:slugged, :history]

  has_many :company_technologies, dependent: :destroy
  has_many :technologies, through: :company_technologies

  belongs_to :city
  has_one :region, through: :city
  has_one :country, through: :region
  has_one :continent, through: :country

  has_one_attached :logo

  validates :name, presence: true
  validates :website, url: { no_local: true, public_suffix: true }
  validates :careers_page, url: { no_local: true, public_suffix: true }, allow_blank: true
  validates :slug, presence: true

  private

  def slug_candidates
    [
      :name,
      [:name, :city],
    ]
  end

  def should_generate_new_friendly_id?
    name_changed? || city_changed? || super
  end
end
