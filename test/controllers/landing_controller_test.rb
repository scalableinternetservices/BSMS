require 'test_helper'

class LandingControllerTest < ActionDispatch::IntegrationTest
  def test_should_get_index
    get landing_index_url
    assert_response :success
  end

end
