require 'test_helper'

class FollowingControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get following_index_url
    assert_response :success
  end

end
