# frozen_string_literal: true

require "test_helper"

class CompanyTest < ActiveSupport::TestCase
  setup do
    @company = companies(:pixelhub)
  end

  test "should not save company without name" do
    @company.name = nil
    assert_not @company.valid?
  end

  test "should not save company with invalid website" do
    @company.website = "invalid"
    assert_not @company.valid?
  end

  test "should save company without website" do
    @company.website = nil
    assert @company.valid?
  end
end
