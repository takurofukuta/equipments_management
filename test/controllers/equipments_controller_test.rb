require "test_helper"

class EquipmentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get equipments_index_url
    assert_response :success
  end

  test "should get edit" do
    get equipments_edit_url
    assert_response :success
  end

  test "should get show" do
    get equipments_show_url
    assert_response :success
  end
end
