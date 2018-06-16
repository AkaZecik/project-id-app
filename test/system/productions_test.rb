require "application_system_test_case"

class ProductionsTest < ApplicationSystemTestCase
  setup do
    @production = productions(:one)
  end

  test "visiting the index" do
    visit productions_url
    assert_selector "h1", text: "Productions"
  end

  test "creating a Production" do
    visit productions_url
    click_on "New Production"

    fill_in "Author", with: @production.author
    fill_in "Name", with: @production.name
    fill_in "Production", with: @production.production_id
    fill_in "Production Type", with: @production.production_type_id
    click_on "Create Production"

    assert_text "Production was successfully created"
    click_on "Back"
  end

  test "updating a Production" do
    visit productions_url
    click_on "Edit", match: :first

    fill_in "Author", with: @production.author
    fill_in "Name", with: @production.name
    fill_in "Production", with: @production.production_id
    fill_in "Production Type", with: @production.production_type_id
    click_on "Update Production"

    assert_text "Production was successfully updated"
    click_on "Back"
  end

  test "destroying a Production" do
    visit productions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Production was successfully destroyed"
  end
end
