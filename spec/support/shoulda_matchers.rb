# frozen_string_literal: true

require "validate_url/rspec_matcher"

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework(:rspec)
    with.library(:rails)
  end
end
