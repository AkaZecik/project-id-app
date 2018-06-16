require 'test_helper'

class EventPerformancesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @event_performance = event_performances(:one)
  end

  test "should get index" do
    get event_performances_url
    assert_response :success
  end

  test "should get new" do
    get new_event_performance_url
    assert_response :success
  end

  test "should create event_performance" do
    assert_difference('EventPerformance.count') do
      post event_performances_url, params: { event_performance: { appearance_id: @event_performance.appearance_id, performance_id: @event_performance.performance_id } }
    end

    assert_redirected_to event_performance_url(EventPerformance.last)
  end

  test "should show event_performance" do
    get event_performance_url(@event_performance)
    assert_response :success
  end

  test "should get edit" do
    get edit_event_performance_url(@event_performance)
    assert_response :success
  end

  test "should update event_performance" do
    patch event_performance_url(@event_performance), params: { event_performance: { appearance_id: @event_performance.appearance_id, performance_id: @event_performance.performance_id } }
    assert_redirected_to event_performance_url(@event_performance)
  end

  test "should destroy event_performance" do
    assert_difference('EventPerformance.count', -1) do
      delete event_performance_url(@event_performance)
    end

    assert_redirected_to event_performances_url
  end
end
