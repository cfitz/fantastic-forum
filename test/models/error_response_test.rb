# frozen_string_literal: true

require "test_helper"

class ErrorResponseTest < ActiveSupport::TestCase
  test "error response should return expected output" do
    error = ErrorResponse.new(code: 401, message: "oops")
    json = error.as_json
    assert_equal 401, json[:code]
    assert_equal "oops", json[:message]
  end
end
