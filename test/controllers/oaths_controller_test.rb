require 'test_helper'

class OathsControllerTest < ActionController::TestCase
  test "should get oath" do
    get :oath
    assert_response :success
  end

  test "should get callback" do
    get :callback
    assert_response :success
  end

end
