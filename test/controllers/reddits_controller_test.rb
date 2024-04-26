require "test_helper"

class RedditsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @reddit = reddits(:one)
  end

  test "should get index" do
    get reddits_url
    assert_response :success
  end

  test "should get new" do
    get new_reddit_url
    assert_response :success
  end

  test "should create reddit" do
    assert_difference("Reddit.count") do
      post reddits_url, params: {reddit: {link: @reddit.link, subreddit: @reddit.subreddit, topic: @reddit.topic}}
    end

    assert_redirected_to reddit_url(Reddit.last)
  end

  test "should show reddit" do
    get reddit_url(@reddit)
    assert_response :success
  end

  test "should get edit" do
    get edit_reddit_url(@reddit)
    assert_response :success
  end

  test "should update reddit" do
    patch reddit_url(@reddit),
          params: {reddit: {link: @reddit.link, subreddit: @reddit.subreddit, topic: @reddit.topic}}
    assert_redirected_to reddit_url(@reddit)
  end

  test "should destroy reddit" do
    assert_difference("Reddit.count", -1) do
      delete reddit_url(@reddit)
    end

    assert_redirected_to reddits_url
  end
end
