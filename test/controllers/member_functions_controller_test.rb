require 'test_helper'

class MemberFunctionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @member_function = member_functions(:one)
  end

  test "should get index" do
    get member_functions_url
    assert_response :success
  end

  test "should get new" do
    get new_member_function_url
    assert_response :success
  end

  test "should create member_function" do
    assert_difference('MemberFunction.count') do
      post member_functions_url, params: { member_function: { function: @member_function.function, member_id: @member_function.member_id, since: @member_function.since, until: @member_function.until } }
    end

    assert_redirected_to member_function_url(MemberFunction.last)
  end

  test "should show member_function" do
    get member_function_url(@member_function)
    assert_response :success
  end

  test "should get edit" do
    get edit_member_function_url(@member_function)
    assert_response :success
  end

  test "should update member_function" do
    patch member_function_url(@member_function), params: { member_function: { function: @member_function.function, member_id: @member_function.member_id, since: @member_function.since, until: @member_function.until } }
    assert_redirected_to member_function_url(@member_function)
  end

  test "should destroy member_function" do
    assert_difference('MemberFunction.count', -1) do
      delete member_function_url(@member_function)
    end

    assert_redirected_to member_functions_url
  end
end
