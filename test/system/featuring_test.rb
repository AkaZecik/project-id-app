require "application_system_test_case"

class FeaturingTest < ApplicationSystemTestCase
  setup do
    @featuring = featuring(:one)
  end

  test "visiting the index" do
    visit featuring_url
    assert_selector "h1", text: "Featuring"
  end

  test "creating a Featuring" do
    visit featuring_url
    click_on "New Featuring"

    fill_in "Artist", with: @featuring.artist_id
    fill_in "Song", with: @featuring.song_id
    click_on "Create Featuring"

    assert_text "Featuring was successfully created"
    click_on "Back"
  end

  test "updating a Featuring" do
    visit featuring_url
    click_on "Edit", match: :first

    fill_in "Artist", with: @featuring.artist_id
    fill_in "Song", with: @featuring.song_id
    click_on "Update Featuring"

    assert_text "Featuring was successfully updated"
    click_on "Back"
  end

  test "destroying a Featuring" do
    visit featuring_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Featuring was successfully destroyed"
  end
end
