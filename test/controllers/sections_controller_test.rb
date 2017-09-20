require 'test_helper'

class SectionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get sections_index_url
    assert_response :success
  end

  test "should get show" do
    get sections_show_url
    assert_response :success
  end

end
