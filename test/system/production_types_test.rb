require "application_system_test_case"

class ProductionTypesTest < ApplicationSystemTestCase
  setup do
    @production_type = production_types(:one)
  end

  test "visiting the index" do
    visit production_types_url
    assert_selector "h1", text: "Production Types"
  end

  test "creating a Production type" do
    visit production_types_url
    click_on "New Production Type"

    fill_in "Name", with: @production_type.name
    fill_in "Production Type", with: @production_type.production_type_id
    fill_in "Super Type", with: @production_type.super_type
    click_on "Create Production type"

    assert_text "Production type was successfully created"
    click_on "Back"
  end

  test "updating a Production type" do
    visit production_types_url
    click_on "Edit", match: :first

    fill_in "Name", with: @production_type.name
    fill_in "Production Type", with: @production_type.production_type_id
    fill_in "Super Type", with: @production_type.super_type
    click_on "Update Production type"

    assert_text "Production type was successfully updated"
    click_on "Back"
  end

  test "destroying a Production type" do
    visit production_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Production type was successfully destroyed"
  end
end
