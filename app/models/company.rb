# frozen_string_literal: true
# typed: strict

class Company < ApplicationRecord
  validates :name, presence: true
  validates :website, url: { no_local: true, public_suffix: true }
end
