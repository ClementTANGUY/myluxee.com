require 'test_helper'

class SalesAssociates::StoresControllerTest < ActionController::TestCase
  setup do
    @request.env["devise.mapping"] = Devise.mappings[:sales_associate]
    @sales_associate = create(:john)
    sign_in @sales_associate
    @store = create(:agnes_store)
    @sales_associate.positions.create store: @store, start_date: 1.year.ago, role: Position::ROLE_LIST.first

  end

  test "should get index" do
    get :index, sales_associate_id: @sales_associate
    assert_response :success
    assert_not_nil assigns(:stores)
  end

  test "should get new" do
    get :new, sales_associate_id: @sales_associate
    assert_response :success
  end

  test "should create store" do
    assert_difference('Position.count') do
      assert_difference('Store.count') do
        post :create, sales_associate_id: @sales_associate, store: { address: @store.address, city: @store.city, country: @store.country, friday: @store.friday, friday_end: @store.friday_end, friday_start: @store.friday_start, monday: @store.monday, monday_end: @store.monday_end, monday_start: @store.monday_start, saturday: @store.saturday, saturday_end: @store.saturday_end, saturday_start: @store.saturday_start, state: @store.state, sunday: @store.sunday, sunday_end: @store.sunday_end, sunday_start: @store.sunday_start, thursday: @store.thursday, thursday_end: @store.thursday_end, thursday_start: @store.thursday_start, tuesday: @store.tuesday, tuesday_end: @store.tuesday_end, tuesday_start: @store.tuesday_start, wednesday: @store.wednesday, wednesday_end: @store.wednesday_end, wednesday_start: @store.wednesday_start, zip_code: @store.zip_code, state: @store.state,
                    positions_attributes: [{role: Position::ROLE_LIST.first, start_date: 1.year.ago, sales_associate_id: @sales_associate}] }
      end
    end

    assert_redirected_to [@sales_associate, assigns(:store)]
  end

  test "should show store" do
    get :show, id: @store, sales_associate_id: @sales_associate
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @store, sales_associate_id: @sales_associate
    assert_response :success
  end

  test "should update store" do
    patch :update, id: @store, sales_associate_id: @sales_associate, store: { address: @store.address, city: @store.city, country: @store.country, friday: @store.friday, friday_end: @store.friday_end, friday_start: @store.friday_start, monday: @store.monday, monday_end: @store.monday_end, monday_start: @store.monday_start, saturday: @store.saturday, saturday_end: @store.saturday_end, saturday_start: @store.saturday_start, state: @store.state, sunday: @store.sunday, sunday_end: @store.sunday_end, sunday_start: @store.sunday_start, thursday: @store.thursday, thursday_end: @store.thursday_end, thursday_start: @store.thursday_start, tuesday: @store.tuesday, tuesday_end: @store.tuesday_end, tuesday_start: @store.tuesday_start, wednesday: @store.wednesday, wednesday_end: @store.wednesday_end, wednesday_start: @store.wednesday_start, zip_code: @store.zip_code }
    assert_redirected_to sales_associate_store_path(sales_associate_id: @sales_associate, id: @store)
  end

  test "should destroy position " do
    assert_difference('Position.count', -1) do
      assert_difference('Store.count', 0) do
        delete :destroy_position, id: @store, sales_associate_id: @sales_associate
      end
    end

    assert_redirected_to sales_associate_stores_path(sales_associate_id: @sales_associate)
  end
end
