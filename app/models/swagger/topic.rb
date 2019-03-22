# frozen_string_literal: true

module Swagger::Topic
  class << self
    def included(base)
      base.include Swagger::Blocks

      # this defines our Model in Swagger.
      base.send(:swagger_component) do
        security_scheme :BearerAuth do
          key :type, :http
          key :scheme, :bearer
          key :bearerFormat, "JWT"
        end

        schema :Topic do
          key :required, [:id, :title, :body, :user_id]
          property :id do
            key :type, :integer
            key :format, :int64
          end
          property :user_id do
            key :type, :integer
            key :format, :int64
          end
          property :title do
            key :type, :string
          end
          property :body do
            key :type, :string
          end
        end

        # This just defines our Model in Swagger as it's accepted in the
        # Controller. Not all attributes are taken as inputs.
        schema :TopicInput do
          key :required, [ :title, :body]
          property :title do
            key :type, :string
          end
          property :body do
            key :type, :string
          end
        end
      end
    end
  end
end
