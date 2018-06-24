require 'test_helper'

class TravelerPlansControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get traveler_plans_index_url
    assert_response :success
  end

  test "should get show" do
    get traveler_plans_show_url
    assert_response :success
  end

  test "should get new" do
    get traveler_plans_new_url
    assert_response :success
  end

  test "should get create" do
    get traveler_plans_create_url
    assert_response :success
  end

  test "should get edit" do
    get traveler_plans_edit_url
    assert_response :success
  end

  test "should get update" do
    get traveler_plans_update_url
    assert_response :success
  end

  test "should get destory" do
    get traveler_plans_destory_url
    assert_response :success
  end

end
