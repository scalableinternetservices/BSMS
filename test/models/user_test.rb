require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "the truth" do
    user = User.new
    assert_not user.save
  end
end
