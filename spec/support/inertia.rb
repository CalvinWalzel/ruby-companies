# frozen_string_literal: true

require "inertia_rails/rspec"

RSpec::Matchers.define(:be_serialized_many) do |expected_scope|
  match do |actual|
    @model = if expected_scope.is_a?(Array)
      expected_scope.first.class.name
    else
      expected_scope.class.name
    end

    @actual_ids = actual&.map { |item| item[:id] }
    @expected_ids = expected_scope&.map(&:id)

    expect(@actual_ids).to(contain_exactly(*@expected_ids))
  end

  failure_message do
    <<~MSG
      expected that the prop would be serialization of the #{@model} scope.

        Expected instances with ids: #{@expected_ids}
             Got instances with ids: #{@actual_ids}
    MSG
  end

  failure_message_when_negated do
    <<~MSG
      expected that the prop would not be serialization of the #{@model} scope.

        Expected instances to not be ids: #{@expected_ids.inspect}
                  Got instances with ids: #{@actual_ids.inspect}
    MSG
  end

  description do
    "be a serialized representation of #{expected_scope}"
  end
end

RSpec::Matchers.define(:be_serialized_one) do |expected|
  match do |actual|
    @model = expected.class.name

    @actual_id = actual&.[](:id)
    @expected_id = expected&.id

    expect(@actual_id).to(eq(@expected_id))
  end

  failure_message do
    <<~MSG
      expected that the prop would be serialization of a #{@model}.

        Expected instance with id: #{@expected_id.inspect}
             Got instance with id: #{@actual_id.inspect}
    MSG
  end

  failure_message_when_negated do
    <<~MSG
      expected that the prop would not be serialization of a #{@model}.

        Expected instance to not be id: #{@expected_id}
                  Got instance with id: #{@actual_id}
    MSG
  end

  description do
    "be a serialized representation of #{expected}"
  end
end
