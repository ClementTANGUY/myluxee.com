require 'test_helper'

class StoresControllerTest < ActionController::TestCase
  test "should get show" do
    get :show, id: create(:agnes_store)
    assert_response :success
  end

end
