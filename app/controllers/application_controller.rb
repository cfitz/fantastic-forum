# frozen_string_literal: true

class ApplicationController < ActionController::API
  include Knock::Authenticable
  before_action :authenticate_user
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :unauthorized
  rescue_from ActiveRecord::RecordNotFound, with: :unauthorized

  private

    def unauthorized
      head :unauthorized
    end
end
