require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get how_to_write" do
    get pages_how_to_write_url
    assert_response :success
  end

end
