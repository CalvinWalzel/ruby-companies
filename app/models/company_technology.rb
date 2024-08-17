# frozen_string_literal: true

class CompanyTechnology < ApplicationRecord
  belongs_to :company
  belongs_to :technology

  validates :company_id, uniqueness: { scope: :technology_id }
end
