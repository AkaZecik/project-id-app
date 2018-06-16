require "application_system_test_case"

class GenreDependenciesTest < ApplicationSystemTestCase
  setup do
    @genre_dependency = genre_dependencies(:one)
  end

  test "visiting the index" do
    visit genre_dependencies_url
    assert_selector "h1", text: "Genre Dependencies"
  end

  test "creating a Genre dependency" do
    visit genre_dependencies_url
    click_on "New Genre Dependency"

    fill_in "Genre", with: @genre_dependency.genre_id
    fill_in "Super Genre", with: @genre_dependency.super_genre_id
    click_on "Create Genre dependency"

    assert_text "Genre dependency was successfully created"
    click_on "Back"
  end

  test "updating a Genre dependency" do
    visit genre_dependencies_url
    click_on "Edit", match: :first

    fill_in "Genre", with: @genre_dependency.genre_id
    fill_in "Super Genre", with: @genre_dependency.super_genre_id
    click_on "Update Genre dependency"

    assert_text "Genre dependency was successfully updated"
    click_on "Back"
  end

  test "destroying a Genre dependency" do
    visit genre_dependencies_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Genre dependency was successfully destroyed"
  end
end
