require 'test_helper'

class PostAnnouncementsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get post_announcements_index_url
    assert_response :success
  end

  test "should get show" do
    get post_announcements_show_url
    assert_response :success
  end

end
