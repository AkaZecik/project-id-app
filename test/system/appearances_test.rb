require "application_system_test_case"

class AppearancesTest < ApplicationSystemTestCase
  setup do
    @appearance = appearances(:one)
  end

  test "visiting the index" do
    visit appearances_url
    assert_selector "h1", text: "Appearances"
  end

  test "creating a Appearance" do
    visit appearances_url
    click_on "New Appearance"

    fill_in "Appearance", with: @appearance.appearance_id
    fill_in "Artist", with: @appearance.artist_id
    fill_in "Event", with: @appearance.event_id
    click_on "Create Appearance"

    assert_text "Appearance was successfully created"
    click_on "Back"
  end

  test "updating a Appearance" do
    visit appearances_url
    click_on "Edit", match: :first

    fill_in "Appearance", with: @appearance.appearance_id
    fill_in "Artist", with: @appearance.artist_id
    fill_in "Event", with: @appearance.event_id
    click_on "Update Appearance"

    assert_text "Appearance was successfully updated"
    click_on "Back"
  end

  test "destroying a Appearance" do
    visit appearances_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Appearance was successfully destroyed"
  end
end
