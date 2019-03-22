# frozen_string_literal: true

class ApplicationController < ActionController::API
  include Knock::Authenticable
  before_action :authenticate_user
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :unauthorized
  rescue_from ActiveRecord::RecordNotFound, with: :unauthorized
  # for out API, we will disable CSRF (for now?)

  private

    def unauthorized
      head :unauthorized
    end
end
