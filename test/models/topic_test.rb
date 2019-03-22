# frozen_string_literal: true

require "test_helper"

class TopicTest < ActiveSupport::TestCase
  def setup
    @vision1 = topics(:vision1)
    @logan1 = topics(:logan1)
    @logan = users(:logan)
    @vision = users(:vision)
  end

  test "topics should have title" do
    topic = Topic.new(body: "body", user: @logan)
    assert_not topic.valid?
    topic.title = "title"
    assert topic.valid?
  end

  test "topics should have a body" do
    topic = Topic.new(title: "title", user: @logan)
    assert_not topic.valid?
    topic.body = "body"
    assert topic.valid?
  end

  test "topics should have a user" do
    topic = Topic.new(title: "title", body: "body")
    assert_not topic.valid?
    topic.user = @logan
    assert topic.valid?
  end

  test "topics should be deleted if the user is deleted" do
    topic = Topic.create(title: "Visions Quest", body: "Doot doot", user: @vision)
    @vision.destroy
    assert_not Topic.find_by id: topic.id
  end

  test "topics should have the auther in the json" do
    assert_equal @logan1.as_json["author"], @logan.name
  end
end
