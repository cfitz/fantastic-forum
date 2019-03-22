# frozen_string_literal: true

class Api::V1::UserTokenController < Knock::AuthTokenController
  skip_before_action :verify_authenticity_token
  private

    def not_found
      head :unauthorized
    end
end
