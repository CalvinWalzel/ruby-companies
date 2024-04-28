# frozen_string_literal: true

class AddIntroductionToCompany < ActiveRecord::Migration[7.1]
  def change
    add_column(:companies, :introduction, :text)
  end
end
