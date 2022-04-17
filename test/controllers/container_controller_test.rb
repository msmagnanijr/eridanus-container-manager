require "test_helper"

class ContainerControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get container_index_url
    assert_response :success
  end

  test "should get new" do
    get container_new_url
    assert_response :success
  end

  test "should get create" do
    get container_create_url
    assert_response :success
  end

  test "should get start" do
    get container_start_url
    assert_response :success
  end

  test "should get stop" do
    get container_stop_url
    assert_response :success
  end

  test "should get delete" do
    get container_delete_url
    assert_response :success
  end
end
