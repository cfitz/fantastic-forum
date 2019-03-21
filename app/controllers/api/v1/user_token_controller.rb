# frozen_string_literal: true

class Api::V1::UserTokenController < Knock::AuthTokenController
  private

    def not_found
      head :unauthorized
    end
end
