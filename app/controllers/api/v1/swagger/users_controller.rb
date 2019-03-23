# frozen_string_literal: true

module Api::V1::Swagger::UsersController
  class << self
    def included(base)
      base.include Swagger::Blocks
      base.send(:swagger_path, "/users/current") do
        operation :get do
          key :description, "get the information for the current user"
          key :operationId, "currentUser"
          key :tags, %W(user)
          response 200 do
            key :description, "token response"
            schema do
              key :'$ref', :User
            end
          end
        end
      end
    end
  end
end
