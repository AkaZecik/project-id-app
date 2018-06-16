require 'test_helper'

class SoundtracksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @soundtrack = soundtracks(:one)
  end

  test "should get index" do
    get soundtracks_url
    assert_response :success
  end

  test "should get new" do
    get new_soundtrack_url
    assert_response :success
  end

  test "should create soundtrack" do
    assert_difference('Soundtrack.count') do
      post soundtracks_url, params: { soundtrack: { production_id: @soundtrack.production_id, song_id: @soundtrack.song_id } }
    end

    assert_redirected_to soundtrack_url(Soundtrack.last)
  end

  test "should show soundtrack" do
    get soundtrack_url(@soundtrack)
    assert_response :success
  end

  test "should get edit" do
    get edit_soundtrack_url(@soundtrack)
    assert_response :success
  end

  test "should update soundtrack" do
    patch soundtrack_url(@soundtrack), params: { soundtrack: { production_id: @soundtrack.production_id, song_id: @soundtrack.song_id } }
    assert_redirected_to soundtrack_url(@soundtrack)
  end

  test "should destroy soundtrack" do
    assert_difference('Soundtrack.count', -1) do
      delete soundtrack_url(@soundtrack)
    end

    assert_redirected_to soundtracks_url
  end
end
