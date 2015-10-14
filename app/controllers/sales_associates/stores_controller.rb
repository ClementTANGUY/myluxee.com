class SalesAssociates::StoresController < ApplicationController
  before_action :set_store, only: [:show, :create_position, :new_position]
  before_action :authenticate_sales_associate!

  def index
    @stores = Store.order("address").all

    render template: "sales_associates/stores/index"
  end

  def show
  end

  def create_position
  end

  def new_position

  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_store
    @store = Store.find(params[:id])
  end

end
