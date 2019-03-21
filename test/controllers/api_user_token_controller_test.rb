# frozen_string_literal: true

require "test_helper"

class ApiUserTokenControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:logan)
  end

  test "should allow creation of valid tokens" do
    post api_v1_user_token_url,
       params: { auth: { email: @user.email, password: "_hey_bub_" } }
    assert_response 201
  end
  test "should return 401 if user with wrong password" do
    post api_v1_user_token_url,
      params: { auth: { email: @user.email, password: "h3ybubbba" } }
    assert_response 401
  end

  test "should return 404 if user is not registered" do
    post api_v1_user_token_url,
      params: { auth: { email: "the-captn@avengers.gov", password: "godblessmerica" } }
    assert_response 401
  end
end
