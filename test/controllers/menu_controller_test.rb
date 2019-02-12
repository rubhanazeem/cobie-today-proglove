require 'test_helper'

class MenuControllerTest < ActionDispatch::IntegrationTest
  test "should get today" do
    get menu_today_url
    assert_response :success
  end

end
