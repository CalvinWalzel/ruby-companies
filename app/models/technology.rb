# frozen_string_literal: true

class Technology < ApplicationRecord
  HEX_COLOR_REGEX = /\A#(?:[0-9a-fA-F]{3}){1,2}\z/

  has_many :company_technologies, dependent: :destroy
  has_many :companies, through: :company_technologies

  validates :name, presence: true, uniqueness: true
  validates :background_color,
    format: { with: HEX_COLOR_REGEX, message: "must be a valid hex color code" },
    allow_blank: true
  validates :text_color,
    format: { with: HEX_COLOR_REGEX, message: "must be a valid hex color code" },
    allow_blank: true
end
