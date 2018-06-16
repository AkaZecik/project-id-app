require "application_system_test_case"

class MemberFunctionsTest < ApplicationSystemTestCase
  setup do
    @member_function = member_functions(:one)
  end

  test "visiting the index" do
    visit member_functions_url
    assert_selector "h1", text: "Member Functions"
  end

  test "creating a Member function" do
    visit member_functions_url
    click_on "New Member Function"

    fill_in "Function", with: @member_function.function
    fill_in "Member", with: @member_function.member_id
    fill_in "Since", with: @member_function.since
    fill_in "Until", with: @member_function.until
    click_on "Create Member function"

    assert_text "Member function was successfully created"
    click_on "Back"
  end

  test "updating a Member function" do
    visit member_functions_url
    click_on "Edit", match: :first

    fill_in "Function", with: @member_function.function
    fill_in "Member", with: @member_function.member_id
    fill_in "Since", with: @member_function.since
    fill_in "Until", with: @member_function.until
    click_on "Update Member function"

    assert_text "Member function was successfully updated"
    click_on "Back"
  end

  test "destroying a Member function" do
    visit member_functions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Member function was successfully destroyed"
  end
end
