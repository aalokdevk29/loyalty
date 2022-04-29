require "test_helper"

class SpendingControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get spending_new_url
    assert_response :success
  end
end
