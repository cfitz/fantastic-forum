# frozen_string_literal: true

require "test_helper"
class UserTest < ActiveSupport::TestCase
  def setup
    @user = users(:logan)
  end

  test "user should have a password" do
    spidey = User.new(name: "Spiderman", email: "p.parker@daily-bulge.com")
    assert_not spidey.valid?
    spidey.password = "maryjane"
    assert spidey.valid?
  end

  test "user should have a strong password" do
    spidey = User.new(name: "Spiderman", password: "123", email: "p.parker@daily-bulge.com")
    assert_not spidey.valid?
    spidey.password = "maryjane"
    assert spidey.valid?
  end

  test "user should have an email" do
    spidey = User.new(name: "Spiderman", password: "maryjane")
    assert_not spidey.valid?
    spidey.email = "p.parker@daily-bulge.com"
    assert spidey.valid?
  end

  test "user should have a name" do
    spidey = User.new(email: "p.parker@daily-bulge.com", password: "maryjane")
    assert_not spidey.valid?
    spidey.name = "spiderman"
    assert spidey.valid?
  end

  test "user should have unique email" do
    spidey = User.new(email: @user.email, name: "Spiderman", password: "maryjane")
    assert_not spidey.valid?
    spidey.email = "p.parker@daily-bulge.com"
    assert spidey.valid?
  end

  test "users can have posts" do
    assert_not @user.topics.nil?
  end

end
