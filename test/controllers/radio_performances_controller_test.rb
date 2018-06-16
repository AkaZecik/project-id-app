require 'test_helper'

class RadioPerformancesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @radio_performance = radio_performances(:one)
  end

  test "should get index" do
    get radio_performances_url
    assert_response :success
  end

  test "should get new" do
    get new_radio_performance_url
    assert_response :success
  end

  test "should create radio_performance" do
    assert_difference('RadioPerformance.count') do
      post radio_performances_url, params: { radio_performance: { performance_id: @radio_performance.performance_id, radio: @radio_performance.radio, time: @radio_performance.time } }
    end

    assert_redirected_to radio_performance_url(RadioPerformance.last)
  end

  test "should show radio_performance" do
    get radio_performance_url(@radio_performance)
    assert_response :success
  end

  test "should get edit" do
    get edit_radio_performance_url(@radio_performance)
    assert_response :success
  end

  test "should update radio_performance" do
    patch radio_performance_url(@radio_performance), params: { radio_performance: { performance_id: @radio_performance.performance_id, radio: @radio_performance.radio, time: @radio_performance.time } }
    assert_redirected_to radio_performance_url(@radio_performance)
  end

  test "should destroy radio_performance" do
    assert_difference('RadioPerformance.count', -1) do
      delete radio_performance_url(@radio_performance)
    end

    assert_redirected_to radio_performances_url
  end
end
