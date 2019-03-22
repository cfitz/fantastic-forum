# frozen_string_literal: true

# This adds Swagger Api Documentation to the controllers.
module Swaggable
  extend ActiveSupport::Concern

  included do
    begin
      klass = self.name.split("::").insert(-2, 'Swagger').join('::')
			self.include klass.constantize
    rescue NameError
      logger.warn("Documentation error: #{klass} not found for #{self.name}")
    end
  end
end
