require 'test_helper'

class AddressesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get addresses_show_url
    assert_response :success
  end

end
