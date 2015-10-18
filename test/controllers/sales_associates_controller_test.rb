require 'test_helper'

class SalesAssociatesControllerTest < ActionController::TestCase
  setup do
    @request.env["devise.mapping"] = Devise.mappings[:sales_associate]
    @sales_associate = FactoryGirl.create(:john)
    sign_in @sales_associate
  end

  def valid_params
    {first_name: "bigtestpass", last_name: "bigtestpass", email: "test@test.com.br", password: "bigtestpass", password_confirmation: "bigtestpass"}
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sales_associates)
  end


  test "should get new" do
    get :new, sales_associate: {first_name: "john"}
    assert_response :success
    assert_equal 1, assigns(:sales_associate).sales_associate_news.size
  end

  test "should get new with params" do
    get :new, sales_associate: {first_name: "john"}
    assert_response :success
    assert_equal 1, assigns(:sales_associate).sales_associate_news.size
    assert_equal "john", assigns(:sales_associate).first_name
  end

  test "should create sales_associate" do
    assert_difference('SalesAssociate.count') do
      post :create, sales_associate: { be_contacted: @sales_associate.be_contacted, be_rated: @sales_associate.be_rated,
                                       email: "1_#{@sales_associate.email}", first_name: @sales_associate.first_name,
                                       last_name: @sales_associate.last_name, password: "bigtestpass", password_confirmation: "bigtestpass" }
    end

    assert_redirected_to sales_associate_stores_path(sales_associate_id: assigns(:sales_associate))
  end

  test "should create sales_associate with news" do
    assert_difference('SalesAssociate.count') do
      assert_difference('SalesAssociateNews.count') do
        post :create, sales_associate: { be_contacted: @sales_associate.be_contacted, be_rated: @sales_associate.be_rated,
                                       email: "1_#{@sales_associate.email}", first_name: @sales_associate.first_name,
                                       last_name: @sales_associate.last_name, password: "bigtestpass", password_confirmation: "bigtestpass",
                                       "sales_associate_news_attributes"=>{"0" => {"content"=>"lets see the news"}}}
      end
    end

  end


  test "should create sales_associate with languages" do
    assert_difference('SalesAssociate.count') do
      assert_difference('SalesAssociateLanguage.count') do
        post :create, sales_associate: { be_contacted: @sales_associate.be_contacted, be_rated: @sales_associate.be_rated,
                                         email: "1_#{@sales_associate.email}", first_name: @sales_associate.first_name,
                                         last_name: @sales_associate.last_name, password: "bigtestpass", password_confirmation: "bigtestpass",
                                         "language_ids"=>[create(:english).id]}
      end
    end

  end


  test "should show sales_associate" do
    get :show, id: @sales_associate
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sales_associate
    assert_response :success
  end

  test "should update sales_associate no stores" do
    patch :update, id: @sales_associate, sales_associate: { be_contacted: @sales_associate.be_contacted, be_rated: @sales_associate.be_rated, email: @sales_associate.email, first_name: @sales_associate.first_name, last_name: @sales_associate.last_name }
    assert_redirected_to sales_associate_stores_path(sales_associate_id: @sales_associate)
  end

  test "should update sales_associate " do
    @sales_associate.positions.create! store: create(:agnes_store), start_date: 1.year.ago, role: Position::ROLE_LIST.first
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
