require 'test_helper'


class Api::V1::TopicsControllerTest < ActionDispatch::IntegrationTest

  setup do
    @logan = users(:logan)
    @vision = users(:vision)
    @topic = topics(:logan1)
  end

  test "should allow anyone to see the list of topics" do
    get api_v1_topics_url
    assert_response :success
  end

  test "should allow anyone to see a topic" do
    get api_v1_topic_url(@topic.id)
    assert_response :success
  end

  test "should not allow unauthed users can create topics" do
    assert_no_difference('Topic.count') do
      post api_v1_topics_url, params: {
        title: 'What?', body: "Come on!" 
      }
    end
    assert_response 401
  end

  test "should allow authed users can create topics" do
    assert_difference('Topic.count') do
      post api_v1_topics_url, headers: authenticated_header(@logan), params: {
         title: 'Best way to shave back?', body: "blah blah blah" 
      }
    end
  end
  
  test "should not allow authed users to modify topics with incorrect values" do
    original_title = @topic.title
    patch api_v1_topic_url(@topic.id), params: { title: nil }
    assert_equal original_title, Topic.find(@topic.id).title
    assert_response 401
  end

  test "should not allow unauthed users to modify topics" do
    original_title = @topic.title
    patch api_v1_topic_url(@topic.id), params: { title: "D'Oh!" }
    assert_equal original_title, Topic.find(@topic.id).title
    assert_response 400
  end

  test "should only allow authors to modify topics" do
    patch api_v1_topic_url(@topic.id), headers: authenticated_header(@logan),
      params: { title: "Changed!" }
    assert_equal "Changed!", Topic.find(@topic.id).title
  end

  test "should not allow non-authors to modify topics" do
    original_title = @topic.title
    patch api_v1_topic_url(@topic.id), headers: authenticated_header(@vision),
      params: { title: "X-Men Suck!" }
    assert_response 401
    assert_not_equal "X-Men Suck!", Topic.find(@topic.id).title
    assert_equal original_title, Topic.find(@topic.id).title
  end

  test "should allow authors to delete topics" do
    t2 = Topic.create(title: 'delete me', body: 'wont live long', user_id: @logan.id)
    assert_difference('Topic.count', -1) do
      delete api_v1_topic_url(t2), headers: authenticated_header(@logan)
    end
    assert_response :ok
  end
  
  test "should not allow non-authors to delete topics" do
    t2 = Topic.create(title: 'delete me', body: 'wont live long', user_id: @logan.id)
    assert_no_difference('Topic.count') do
      delete api_v1_topic_url(t2), headers: authenticated_header(@vision)
    end
    assert_response 401
  end
  
  test "should not allow non-authed to delete topics" do
    t2 = Topic.create(title: 'delete me', body: 'wont live long', user_id: @logan.id)
    assert_no_difference('Topic.count') do
      delete api_v1_topic_url(t2)
    end
    assert_response 401
  end

end
