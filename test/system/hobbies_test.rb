require "application_system_test_case"

class HobbiesTest < ApplicationSystemTestCase
  setup do
    @hobby = hobbies(:one)
  end

  test "visiting the index" do
    visit hobbies_url
    assert_selector "h1", text: "Hobbies"
  end

  test "should create hobby" do
    visit hobbies_url
    click_on "New hobby"

    fill_in "Name", with: @hobby.name
    fill_in "Profile ids", with: @hobby.profile_ids
    click_on "Create Hobby"

    assert_text "Hobby was successfully created"
    click_on "Back"
  end

  test "should update Hobby" do
    visit hobby_url(@hobby)
    click_on "Edit this hobby", match: :first

    fill_in "Name", with: @hobby.name
    fill_in "Profile ids", with: @hobby.profile_ids
    click_on "Update Hobby"

    assert_text "Hobby was successfully updated"
    click_on "Back"
  end

  test "should destroy Hobby" do
    visit hobby_url(@hobby)
    click_on "Destroy this hobby", match: :first

    assert_text "Hobby was successfully destroyed"
  end
end
