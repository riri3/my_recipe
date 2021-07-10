require 'test_helper'

class WeeklyMenusControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get weekly_menus_index_url
    assert_response :success
  end

end
