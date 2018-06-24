require 'test_helper'

class AgentsControllerTest < ActionDispatch::IntegrationTest
  test "should get dashboard" do
    get agents_dashboard_url
    assert_response :success
  end

  test "should get new" do
    get agents_new_url
    assert_response :success
  end

  test "should get create" do
    get agents_create_url
    assert_response :success
  end

  test "should get update" do
    get agents_update_url
    assert_response :success
  end

  test "should get edit" do
    get agents_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get agents_destroy_url
    assert_response :success
  end

  test "should get index" do
    get agents_index_url
    assert_response :success
  end

  test "should get show" do
    get agents_show_url
    assert_response :success
  end

end
