class SalesAssociatesController < ApplicationController
  before_action :set_sales_associate, only: [:show, :edit, :update, :destroy]
  #before_action :set_sales_associate, only: [:show]

  def wizard_create
    @sales_associate = SalesAssociate.new(sales_associate_params)
    @sales_associate.sales_associate_news.build(content: I18n.t('sales_associates.news_initial_content'))
    render :new
  end
  # GET /sales_associates
  # GET /sales_associates.json
  def index
    @sales_associates = SalesAssociate.all
  end

  # GET /sales_associates/1
  # GET /sales_associates/1.json
  def show
  end

  # GET /sales_associates/new
  def new
    @sales_associate = SalesAssociate.new
    @sales_associate.sales_associate_news.build(content: I18n.t('sales_associates.news_initial_content'))
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sales_associate
      @sales_associate = SalesAssociate.find(params[:id])
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def sales_associate_params
      params.require(:sales_associate).permit(:first_name, :provider, :uid, :contact_email, :last_name, :email, :be_contacted, :be_rated, :password,
                                              :password_confirmation,sales_associate_news_attributes: [:id,:content])
    end
end
