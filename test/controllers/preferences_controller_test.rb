require 'test_helper'

class PreferencesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test "should get index" do
    sign_in users(:one)
    get preferences_show_url
    assert_response :success
  end

  test "should get new" do
    sign_in users(:one)
    get preferences_new_url
    assert_response :success
  end

  test "should create preference" do
    sign_in users(:one)
    assert_difference('Preferences.count') do
      post preferences_new_url, params: { preferences: { bedrooms: 1,
                                                        parking: 1,
                                                        price: 1,
                                                        user_id: 1000} }
    end

    assert_redirected_to preferences_show_url
  end

  test "should show preference" do
    sign_in users(:one)
    get preferences_show_url(@preference)
    assert_response :success
  end

  test "should get edit" do
    sign_in users(:one)
    assert_difference('Preferences.count') do
      post preferences_new_url, params: { preferences: { bedrooms: 1,
                                                        parking: 1,
                                                        price: 1,
                                                        user_id: 1000} }
    end
    get preferences_edit_url
    assert_response :success
  end

  test "should update preference" do
    sign_in users(:one)
    assert_difference('Preferences.count') do
      post preferences_new_url, params: { preferences: { bedrooms: 1,
                                                        parking: 1,
                                                        price: 1,
                                                        user_id: 1000} }
    end
    patch preferences_edit_url, params: { preferences: { bedrooms: 1,
                                                         parking: 1,
                                                         price: 1,
                                                         user_id: 1000} }
    assert_redirected_to preferences_show_url
  end
end
