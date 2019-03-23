# frozen_string_literal: true

class ErrorResponse
  include SwaggableModel
  attr_reader :code, :message

  def initialize(**opts)
    @code = opts[:code]
    @message = opts[:message]
  end

  def as_json
    { code: @code, message: @message }
  end
end
