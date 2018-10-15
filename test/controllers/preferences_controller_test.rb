require 'test_helper'

class PreferencesControllerTest < ActionDispatch::IntegrationTest

  test "should get index" do
    get preferences_show_url
    assert_response :success
  end

  test "should get new" do
    get preferences_new_url
    assert_response :success
  end

  test "should create preference" do
    assert_difference('Preferences.count') do
      post preferences_new_url, params: { preference: {  } }
    end

    assert_redirected_to preferences_show_url(Preference.last)
  end

  test "should show preference" do
    get preferences_show_url(@preference)
    assert_response :success
  end

  test "should get edit" do
    get preferences_edit_url(@preference)
    assert_response :success
  end

  test "should update preference" do
    patch preferences_edit_url(@preference), params: { preference: {  } }
    assert_redirected_to preferences_show_url(@preference)
  end

  # test "should destroy preference" do
  #   assert_difference('Preferences.count', -1) do
  #     delete preferences_show_url(@preference)
  #   end

  #   assert_redirected_to preferences_show_url
  # end
end
