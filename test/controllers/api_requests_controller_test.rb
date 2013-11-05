require 'test_helper'

class ApiRequestsControllerTest < ActionController::TestCase
  test "should get postal_code" do
    get :postal_code
    assert_response :success
  end

end
