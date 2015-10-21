class SalesAssociates::NewsController < ApplicationController
  before_action :authenticate_sales_associate!

  def create
    current_sales_associate.sales_associate_news.create(content: params[:content])
    redirect_to current_sales_associate
  end
end
