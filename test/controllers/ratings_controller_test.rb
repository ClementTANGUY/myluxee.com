require 'test_helper'

class RatingsControllerTest < ActionController::TestCase
  setup do
    @sales_associate = create(:john)
    @account = create(:peter)
    sign_in @account
  end

  test "should get new" do
    get :new, sales_associate_id: @sales_associate
    assert_response :success
  end

end
