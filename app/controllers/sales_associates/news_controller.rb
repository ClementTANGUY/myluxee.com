class SalesAssociates::NewsController < ApplicationController
  before_action :authenticate_sales_associate!

  def create
    @news = current_sales_associate.sales_associate_news.create(content: params[:content])
  end

  def destroy
    @news_id = params[:id]
    @news = current_sales_associate.sales_associate_news.find(params[:id])
    @news.destroy
  end
end
