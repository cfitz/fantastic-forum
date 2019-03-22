# frozen_string_literal: true

class Api::ApiDocsController < ApplicationController
  include Swagger::Blocks
  skip_before_action :authenticate_user, only: %i(index)

  swagger_root do
    key :openapi, "3.0.0"
    info do
      key :version, "1.0.0"
      key :title, "Swagger Fantastic Forum"
      key :description, "API to post topics to the forum" \
                        "demonstrate features in the swagger-2.0 specification"
      key :termsOfService, "http://fantastic.io"
      contact do
        key :name, "Chris Fitzpatrick"
      end
      license do
        key :name, "MIT"
      end
    end

    server do
      key :url, "http://localhost:3000/api/{version}"
      key :description, "The main prod server"

      variable :version do
        key :enum, ["v1"]
        key :default, :v1
      end
    end


    security do
      key :BearerAuth, []
    end

    tag do
      key :name, "topic"
      key :description, "Topic operations"
      externalDocs do
        key :description, "Find more info here"
        key :url, "https://swagger.io"
      end
    end
    key :host, "localhost:3000"
    key :basePath, "/api"
    key :consumes, ["application/json"]
    key :produces, ["application/json"]
  end

  # A list of all classes that have swagger_* declarations.
  SWAGGERED_CLASSES = [
    Api::V1::TopicsController,
    Topic,
    self,
  ].freeze

  def index
    render json: Swagger::Blocks.build_root_json(SWAGGERED_CLASSES)
  end
end
