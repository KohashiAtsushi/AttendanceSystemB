require 'test_helper'

class ApprovalControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get approval_new_url
    assert_response :success
  end

end
