require "test_helper"

class CoinsControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get coins_home_url
    assert_response :success
  end
end
