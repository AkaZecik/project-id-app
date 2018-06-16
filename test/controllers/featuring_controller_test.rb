require 'test_helper'

class FeaturingControllerTest < ActionDispatch::IntegrationTest
  setup do
    @featuring = featuring(:one)
  end

  test "should get index" do
    get featuring_index_url
    assert_response :success
  end

  test "should get new" do
    get new_featuring_url
    assert_response :success
  end

  test "should create featuring" do
    assert_difference('Featuring.count') do
      post featuring_index_url, params: { featuring: { artist_id: @featuring.artist_id, song_id: @featuring.song_id } }
    end

    assert_redirected_to featuring_url(Featuring.last)
  end

  test "should show featuring" do
    get featuring_url(@featuring)
    assert_response :success
  end

  test "should get edit" do
    get edit_featuring_url(@featuring)
    assert_response :success
  end

  test "should update featuring" do
    patch featuring_url(@featuring), params: { featuring: { artist_id: @featuring.artist_id, song_id: @featuring.song_id } }
    assert_redirected_to featuring_url(@featuring)
  end

  test "should destroy featuring" do
    assert_difference('Featuring.count', -1) do
      delete featuring_url(@featuring)
    end

    assert_redirected_to featuring_index_url
  end
end
