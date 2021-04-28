require "test_helper"

class OperationHistoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get operation_histories_index_url
    assert_response :success
  end
end
