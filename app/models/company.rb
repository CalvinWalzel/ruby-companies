# frozen_string_literal: true
# typed: strict

class Company < ApplicationRecord
  has_many :company_technologies, dependent: :destroy
  has_many :technologies, through: :company_technologies

  belongs_to :city
  has_one :region, through: :city
  has_one :country, through: :region
  has_one :continent, through: :country

  validates :name, presence: true
  validates :website, url: { no_local: true, public_suffix: true }
  validates :careers_page, url: { no_local: true, public_suffix: true }, allow_blank: true
end
