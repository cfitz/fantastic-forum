# frozen_string_literal: true

class Api::V1::UsersController < ApplicationController
  before_action :authenticate_user

  def current
    render json: current_user.as_json(only: %i(id email name))
  end
end
