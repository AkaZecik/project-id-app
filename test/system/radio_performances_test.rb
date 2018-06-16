require "application_system_test_case"

class RadioPerformancesTest < ApplicationSystemTestCase
  setup do
    @radio_performance = radio_performances(:one)
  end

  test "visiting the index" do
    visit radio_performances_url
    assert_selector "h1", text: "Radio Performances"
  end

  test "creating a Radio performance" do
    visit radio_performances_url
    click_on "New Radio Performance"

    fill_in "Performance", with: @radio_performance.performance_id
    fill_in "Radio", with: @radio_performance.radio
    fill_in "Time", with: @radio_performance.time
    click_on "Create Radio performance"

    assert_text "Radio performance was successfully created"
    click_on "Back"
  end

  test "updating a Radio performance" do
    visit radio_performances_url
    click_on "Edit", match: :first

    fill_in "Performance", with: @radio_performance.performance_id
    fill_in "Radio", with: @radio_performance.radio
    fill_in "Time", with: @radio_performance.time
    click_on "Update Radio performance"

    assert_text "Radio performance was successfully updated"
    click_on "Back"
  end

  test "destroying a Radio performance" do
    visit radio_performances_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Radio performance was successfully destroyed"
  end
end
