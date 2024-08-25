# frozen_string_literal: true
# typed: strict

class Company < ApplicationRecord
  has_many :company_technologies, dependent: :destroy
  has_many :technologies, through: :company_technologies

  validates :name, presence: true
  validates :website, url: { no_local: true, public_suffix: true }
  validates :careers_page, url: { no_local: true, public_suffix: true }, allow_blank: true
end
