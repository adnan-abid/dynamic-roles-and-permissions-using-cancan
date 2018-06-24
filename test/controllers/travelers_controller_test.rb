require 'test_helper'

class TravelersControllerTest < ActionDispatch::IntegrationTest
  test "should get dashboard" do
    get travelers_dashboard_url
    assert_response :success
  end

  test "should get new" do
    get travelers_new_url
    assert_response :success
  end

  test "should get create" do
    get travelers_create_url
    assert_response :success
  end

  test "should get update" do
    get travelers_update_url
    assert_response :success
  end

  test "should get edit" do
    get travelers_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get travelers_destroy_url
    assert_response :success
  end

  test "should get index" do
    get travelers_index_url
    assert_response :success
  end

  test "should get show" do
    get travelers_show_url
    assert_response :success
  end

end
