require "application_system_test_case"

class EventPerformancesTest < ApplicationSystemTestCase
  setup do
    @event_performance = event_performances(:one)
  end

  test "visiting the index" do
    visit event_performances_url
    assert_selector "h1", text: "Event Performances"
  end

  test "creating a Event performance" do
    visit event_performances_url
    click_on "New Event Performance"

    fill_in "Appearance", with: @event_performance.appearance_id
    fill_in "Performance", with: @event_performance.performance_id
    click_on "Create Event performance"

    assert_text "Event performance was successfully created"
    click_on "Back"
  end

  test "updating a Event performance" do
    visit event_performances_url
    click_on "Edit", match: :first

    fill_in "Appearance", with: @event_performance.appearance_id
    fill_in "Performance", with: @event_performance.performance_id
    click_on "Update Event performance"

    assert_text "Event performance was successfully updated"
    click_on "Back"
  end

  test "destroying a Event performance" do
    visit event_performances_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Event performance was successfully destroyed"
  end
end
