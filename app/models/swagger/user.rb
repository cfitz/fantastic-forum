# frozen_string_literal: true

module Swagger::User
  class << self
    def included(base)
      base.include Swagger::Blocks

      base.send(:swagger_component) do
        schema :User do
          key :required, [:id, :email, :name]
          property :id do
            key :type, :integer
            key :format, :int64
          end
          property :topic_count do
            key :type, :integer
            key :format, :int64
          end
          property :email do
            key :type, :string
          end
          property :name do
            key :type, :string
          end
        end
      end
    end
  end
end
