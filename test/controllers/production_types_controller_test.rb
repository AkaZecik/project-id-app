require 'test_helper'

class ProductionTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @production_type = production_types(:one)
  end

  test "should get index" do
    get production_types_url
    assert_response :success
  end

  test "should get new" do
    get new_production_type_url
    assert_response :success
  end

  test "should create production_type" do
    assert_difference('ProductionType.count') do
      post production_types_url, params: { production_type: { name: @production_type.name, production_type_id: @production_type.production_type_id, super_type: @production_type.super_type } }
    end

    assert_redirected_to production_type_url(ProductionType.last)
  end

  test "should show production_type" do
    get production_type_url(@production_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_production_type_url(@production_type)
    assert_response :success
  end

  test "should update production_type" do
    patch production_type_url(@production_type), params: { production_type: { name: @production_type.name, production_type_id: @production_type.production_type_id, super_type: @production_type.super_type } }
    assert_redirected_to production_type_url(@production_type)
  end

  test "should destroy production_type" do
    assert_difference('ProductionType.count', -1) do
      delete production_type_url(@production_type)
    end

    assert_redirected_to production_types_url
  end
end
