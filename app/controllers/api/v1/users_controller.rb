# frozen_string_literal: true

class Api::V1::UsersController < ApplicationController

  def current
    render json: current_user.as_json(only: %i(id email name))
  end
end
