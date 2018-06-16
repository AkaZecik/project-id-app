require 'test_helper'

class GenreDependenciesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @genre_dependency = genre_dependencies(:one)
  end

  test "should get index" do
    get genre_dependencies_url
    assert_response :success
  end

  test "should get new" do
    get new_genre_dependency_url
    assert_response :success
  end

  test "should create genre_dependency" do
    assert_difference('GenreDependency.count') do
      post genre_dependencies_url, params: { genre_dependency: { genre_id: @genre_dependency.genre_id, super_genre_id: @genre_dependency.super_genre_id } }
    end

    assert_redirected_to genre_dependency_url(GenreDependency.last)
  end

  test "should show genre_dependency" do
    get genre_dependency_url(@genre_dependency)
    assert_response :success
  end

  test "should get edit" do
    get edit_genre_dependency_url(@genre_dependency)
    assert_response :success
  end

  test "should update genre_dependency" do
    patch genre_dependency_url(@genre_dependency), params: { genre_dependency: { genre_id: @genre_dependency.genre_id, super_genre_id: @genre_dependency.super_genre_id } }
    assert_redirected_to genre_dependency_url(@genre_dependency)
  end

  test "should destroy genre_dependency" do
    assert_difference('GenreDependency.count', -1) do
      delete genre_dependency_url(@genre_dependency)
    end

    assert_redirected_to genre_dependencies_url
  end
end
