require 'test_helper'

class FriendlistsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get friendlists_index_url
    assert_response :success
  end

end
