# frozen_string_literal: true

module Api::V1::Swagger::UserTokenController
  class << self
    def included(base)
      base.include Swagger::Blocks
      base.send(:swagger_component) do
        schema :Token do
          property :jwt do
            key :type, :string
          end
        end
        schema :AuthInput do
          property :auth do
            key :type, :object
            property :email do
              key :type, :string
            end
            property :password do
              key :type, :string
            end
          end
        end
      end

      base.send(:swagger_path, "/user/token") do
        operation :post do
          key :description, "generate a user token"
          key :operationId, "createUserToken"
          key :tags, %W(user)
          request_body do
            key :description, "Get a user token"
            key :required, true
            content "application/json" do
              schema do
                key :'$ref', :AuthInput
              end
            end
          end
          response 200 do
            key :description, "token response"
            schema do
              key :'$ref', :Token
            end
          end
        end
      end
    end
  end
end
