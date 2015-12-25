require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get terms_of_service" do
    get :terms_of_service
    assert_response :success
  end

  test "should get acceptable_use_policy" do
    get :acceptable_use_policy
    assert_response :success
  end

  test "should get privacy_policy" do
    get :privacy_policy
    assert_response :success
  end

end
