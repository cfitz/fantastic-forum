# frozen_string_literal: true

class Api::V1::UsersController < ApplicationController
  include Swaggable
  def current
    render json: current_user.as_json
  end
end
