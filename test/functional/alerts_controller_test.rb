require 'test_helper'

class AlertsControllerTest < ActionController::TestCase
  test "should get quick_sms" do
    get :quick_sms
    assert_response :success
  end

  test "should get noticeboard" do
    get :noticeboard
    assert_response :success
  end

end
