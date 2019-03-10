require 'test_helper'

class AccountsControllerTest < ActionController::TestCase
  setup do
    @request.env["devise.mapping"] = Devise.mappings[:account]
    @account = FactoryBot.create(:peter)
    sign_in @account
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create account" do
    assert_difference('Account.count') do
      post :create, account: { email: "aa#{@account.email}", first_name: @account.first_name, last_name: @account.last_name, password: 'testtest', password_confirmation: 'testtest' }
    end

    assert_redirected_to account_path(assigns(:account))
  end

  test "should show account" do
    get :show, id: @account
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @account
    assert_response :success
  end

  test "should update account" do
    patch :update, id: @account, account: { first_name: @account.first_name, last_name: @account.last_name }
    assert_redirected_to account_path(assigns(:account))
  end

  test "should destroy account" do
    assert_difference('Account.count', -1) do
      delete :destroy, id: @account
    end

    assert_redirected_to root_path
  end
end
