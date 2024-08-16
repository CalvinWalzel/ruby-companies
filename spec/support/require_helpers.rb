# frozen_string_literal: true

def require_factories
  require Rails.root.join("spec/support/factory_bot.rb")
end

def require_inertia
  require Rails.root.join("spec/support/inertia.rb")
end
