# frozen_string_literal: true

class PaginationSerializer < ApplicationSerializer
  hash_attributes(
    :scaffold_url,
    :page,
    :pages,
    :prev,
    :next,
  )
end
