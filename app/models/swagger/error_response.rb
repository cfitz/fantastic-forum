# frozen_string_literal: true

module Swagger::ErrorResponse
  class << self
    def included(base)
      base.include Swagger::Blocks
      base.send(:swagger_component) do
        schema :ErrorResponse do
          property :code do
            key :type, :integer
            key :format, :int64
          end
          property :message do
            key :type, :string
          end
        end
      end
    end
  end
end
