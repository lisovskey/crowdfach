require 'test_helper'

class IdentificationControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get identification_new_url
    assert_response :success
  end

  test "should get create" do
    get identification_create_url
    assert_response :success
  end

end
