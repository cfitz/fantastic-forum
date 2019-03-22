# frozen_string_literal: true

require "active_support/concern"

# This is similar to the Controllers Concern, allowing us to add Swagger defs to
# the models.
module SwaggableModel
  extend ActiveSupport::Concern

  included do
    begin
      klass = "Swagger::#{self.name}"
      self.include klass.constantize
    rescue NameError
      logger.warn("Documentation error: #{klass} not found for #{self.name}")
    end
  end
end
