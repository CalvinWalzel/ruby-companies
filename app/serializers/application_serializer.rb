# frozen_string_literal: true

class ApplicationSerializer < Oj::Serializer
  transform_keys :camelize
end
