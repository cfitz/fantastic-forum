# frozen_string_literal: true

class ApplicationController < ActionController::API
  include Knock::Authenticable
  before_action :authenticate_user
  include Pundit
  #protect_from_forgery
  rescue_from Pundit::NotAuthorizedError, with: :unauthorized
  rescue_from ActiveRecord::RecordNotFound, with: :unauthorized

  private
    def authenticate_v1_user
      authenticate_for V1::User
    end

    def unauthorized
      head :unauthorized
    end
end
