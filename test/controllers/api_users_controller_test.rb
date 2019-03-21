# frozen_string_literal: true

require "test_helper"

class ApiUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:logan)
  end

  test "should not see the current user not autenticated" do
    get api_v1_users_current_url
    assert_response 401
  end

  test "should see the current user if autenticated" do
    get api_v1_users_current_url, headers: authenticated_header(@user)
    assert_response :success
  end
end
