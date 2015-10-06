require 'test_helper'

class SalesAssociatesControllerTest < ActionController::TestCase
  setup do
    @sales_associate = sales_associates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sales_associates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sales_associate" do
    assert_difference('SalesAssociate.count') do
      post :create, sales_associate: { be_contacted: @sales_associate.be_contacted, be_rated: @sales_associate.be_rated, email: @sales_associate.email, first_name: @sales_associate.first_name, last_name: @sales_associate.last_name }
    end

    assert_redirected_to sales_associate_path(assigns(:sales_associate))
  end

  test "should show sales_associate" do
    get :show, id: @sales_associate
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sales_associate
    assert_response :success
  end

  test "should update sales_associate" do
    patch :update, id: @sales_associate, sales_associate: { be_contacted: @sales_associate.be_contacted, be_rated: @sales_associate.be_rated, email: @sales_associate.email, first_name: @sales_associate.first_name, last_name: @sales_associate.last_name }
    assert_redirected_to sales_associate_path(assigns(:sales_associate))
  end

  test "should destroy sales_associate" do
    assert_difference('SalesAssociate.count', -1) do
      delete :destroy, id: @sales_associate
    end

    assert_redirected_to sales_associates_path
  end
end
