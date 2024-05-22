require "application_system_test_case"

class RedditsTest < ApplicationSystemTestCase
  setup do
    @reddit = reddits(:one)
  end

  test "visiting the index" do
    visit reddits_url
    assert_selector "h1", text: I18n.t("root_page.reddits")
  end

  test "should create reddit" do
    visit reddits_url
    click_on "New reddit"

    fill_in "Link", with: @reddit.link
    fill_in "Subreddit", with: @reddit.subreddit
    fill_in "Topic", with: @reddit.topic
    click_on "Create Reddit"

    assert_text "Reddit was successfully created"
    click_on "Back"
  end

  test "should update Reddit" do
    visit reddit_url(@reddit)
    click_on "Edit this reddit", match: :first

    fill_in "Link", with: @reddit.link
    fill_in "Subreddit", with: @reddit.subreddit
    fill_in "Topic", with: @reddit.topic
    click_on "Update Reddit"

    assert_text "Reddit was successfully updated"
    click_on "Back"
  end

  test "should destroy Reddit" do
    visit reddit_url(@reddit)
    click_on "Destroy this reddit", match: :first

    assert_text "Reddit was successfully destroyed"
  end
end
