require 'test_helper'

class RangersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get rangers_index_url
    assert_response :success
  end

  test "should get new" do
    get rangers_new_url
    assert_response :success
  end

  test "should get edit" do
    get rangers_edit_url
    assert_response :success
  end

  test "should get show" do
    get rangers_show_url
    assert_response :success
  end

end
