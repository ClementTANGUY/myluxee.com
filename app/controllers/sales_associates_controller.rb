class SalesAssociatesController < ApplicationController
  before_action :authenticate_sales_associate!, except: [:new, :create, :show]
  before_action :set_sales_associate, only: [:show]
  #before_action :set_sales_associate, only: [:show]
  before_action :set_devise_information, only: [:show, :edit, :new, :create, :update]

  def wizard_create
    @sales_associate = SalesAssociate.new(sales_associate_params)
    @sales_associate.sales_associate_news.build(content: I18n.t('sales_associates.news_initial_content'))
    render :new
  end

  def edit
    @sales_associate = current_sales_associate
    if @sales_associate.sales_associate_news.empty?
      @sales_associate.sales_associate_news.build
    end
  end

  # GET /sales_associates/1
  # GET /sales_associates/1.json
  def show
  end

  # GET /sales_associates/new
  def new
    if params[:sales_associate].nil?
      @sales_associate = SalesAssociate.new
    else
      @sales_associate = SalesAssociate.new(sales_associate_params)
    end

    @sales_associate.sales_associate_news.build(content: I18n.t('sales_associates.news_initial_content'))
  end

  # POST /sales_associates
  # POST /sales_associates.json
  def create
    @sales_associate = SalesAssociate.new(sales_associate_params)

    respond_to do |format|
      if @sales_associate.save
        sign_in @sales_associate
        format.html { redirect_to sales_associate_stores_path(sales_associate_id: @sales_associate),
                                  notice: 'Sales associate was successfully created.' }
        format.json { render :show, status: :created, location: @sales_associate }
      else
        format.html { render :new }
        format.json { render json: @sales_associate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sales_associates/1
  # PATCH/PUT /sales_associates/1.json
  def update
    @sales_associate = current_sales_associate
    respond_to do |format|
      if @sales_associate.update(sales_associate_params)
        format.html { redirect_to @sales_associate.stores.empty? ? sales_associate_stores_path(sales_associate_id: @sales_associate) : @sales_associate, notice: 'Sales associate was successfully updated.' }
        format.json { render :show, status: :ok, location: @sales_associate }
      else
        format.html { render :edit }
        format.json { render json: @sales_associate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sales_associates/1
  # DELETE /sales_associates/1.json
  def destroy
    current_sales_associate.destroy
    sign_out current_sales_associate
    respond_to do |format|
      format.html { redirect_to root_path }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sales_associate
      @sales_associate = SalesAssociate.find(params[:id])
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def sales_associate_params
      params.require(:sales_associate).permit(:avatar, :first_name, :provider, :uid, :contact_email, :last_name, :email, :be_contacted, :be_rated, :password,
           :password_confirmation,sales_associate_news_attributes: [:id,:content], language_ids: [])
    end

    def set_devise_information
      @resource = @sales_associate
      @devise_mapping = Devise.mappings[:sales_associate]
    end
end
