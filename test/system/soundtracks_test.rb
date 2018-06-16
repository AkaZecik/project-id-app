require "application_system_test_case"

class SoundtracksTest < ApplicationSystemTestCase
  setup do
    @soundtrack = soundtracks(:one)
  end

  test "visiting the index" do
    visit soundtracks_url
    assert_selector "h1", text: "Soundtracks"
  end

  test "creating a Soundtrack" do
    visit soundtracks_url
    click_on "New Soundtrack"

    fill_in "Production", with: @soundtrack.production_id
    fill_in "Song", with: @soundtrack.song_id
    click_on "Create Soundtrack"

    assert_text "Soundtrack was successfully created"
    click_on "Back"
  end

  test "updating a Soundtrack" do
    visit soundtracks_url
    click_on "Edit", match: :first

    fill_in "Production", with: @soundtrack.production_id
    fill_in "Song", with: @soundtrack.song_id
    click_on "Update Soundtrack"

    assert_text "Soundtrack was successfully updated"
    click_on "Back"
  end

  test "destroying a Soundtrack" do
    visit soundtracks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Soundtrack was successfully destroyed"
  end
end
