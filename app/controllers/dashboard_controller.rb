class DashboardController < ApplicationController
  before_action :authenticate_sales_associate!

  def index
  end
end
