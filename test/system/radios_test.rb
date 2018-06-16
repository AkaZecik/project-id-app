require "application_system_test_case"

class RadiosTest < ApplicationSystemTestCase
  setup do
    @radio = radios(:one)
  end

  test "visiting the index" do
    visit radios_url
    assert_selector "h1", text: "Radios"
  end

  test "creating a Radio" do
    visit radios_url
    click_on "New Radio"

    fill_in "Name", with: @radio.name
    click_on "Create Radio"

    assert_text "Radio was successfully created"
    click_on "Back"
  end

  test "updating a Radio" do
    visit radios_url
    click_on "Edit", match: :first

    fill_in "Name", with: @radio.name
    click_on "Update Radio"

    assert_text "Radio was successfully updated"
    click_on "Back"
  end

  test "destroying a Radio" do
    visit radios_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Radio was successfully destroyed"
  end
end
