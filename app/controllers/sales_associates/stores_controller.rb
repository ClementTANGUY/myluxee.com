class SalesAssociates::StoresController < ApplicationController
  before_action :set_store, only: [:destroy_news, :create_news, :show,:edit_position,:finish_position,:destroy_position, :edit, :update, :destroy]
  before_action :authenticate_sales_associate!

  def index
    @stores = Store.includes(:brand).order("brands.name")
    if @brand = params[:brand] and !@brand.blank?
      @stores = @stores.where("brands.id = ?", @brand)
    end
    if @speciality = params[:speciality] and !@speciality.blank?
      @stores = @stores.where("brands.speciality = ?", @speciality)
    end
    if @address = params[:address] and !@address.blank?
      @stores = @stores.where(["address like ?", "%#{@address}%" ])
    end
    @stores = @stores.page(params[:page]).per(15).all

    render template: "sales_associates/stores/index"
  end

  def show
  end

  def create_position
    @store = Store.find(params[:id])
    unless Position.exists?(sales_associate: current_sales_associate, store: @store)
      @position = Position.new(sales_associate: current_sales_associate, store: @store, role: params[:role], start_date: params[:start_date])
        unless @position.save
          flash[:alert] = I18n.t('sales_associates.create_position.failed_position')
        end
    else
      flash[:alert] = I18n.t('sales_associates.create_position.exists_position')
    end
    redirect_to sales_associate_stores_path(sales_associate_id: current_sales_associate)
  end

  def new_position
    @store = Store.find(params[:id])
  end

  def edit_position
  end

  def undo_position
    if position = current_sales_associate.all_positions.where(store_id: params[:id]).first
      position.update_attribute(:end_date, nil)
    end
    redirect_to sales_associate_stores_path(sales_associate_id: current_sales_associate)
  end

  def finish_position
    if position = current_sales_associate.positions.where(store_id: params[:id]).first
      position.update({end_date: params[:end_date]})
    end
    redirect_to sales_associate_stores_path(sales_associate_id: current_sales_associate)
  end

  def destroy_position
    current_sales_associate.all_stores.destroy(@store)
    redirect_to sales_associate_stores_path(sales_associate_id: current_sales_associate)
  end

  # GET /stores/1
  # GET /stores/1.json
  def show
  end

  # GET /stores/new
  def new
    @store = Store.new
    @position = Position.new(store: @store, sales_associate: current_sales_associate)
  end

  # GET /stores/1/edit
  def edit
    @position = @store.positions.where(user_id: current_sales_associate.id)
  end

  def create_news
    @store_news = @store.store_news.create(content: params[:content])
  end

  def destroy_news
    @store_news_id = params[:store_news_id]
    @store_news = @store.store_news.find(params[:store_news_id])
    @store_news.destroy
  end

  # POST /stores
  # POST /stores.json
  def create
    @store = Store.new(store_params)
    respond_to do |format|
      if @store.save
        format.html { redirect_to [current_sales_associate,  @store],
                                  notice: 'Store was successfully created.' }
        format.json { render :show, status: :created, location: @store }
      else
        format.html { render :new }
        format.json { render json: @store.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stores/1
  # PATCH/PUT /stores/1.json
  def update
    respond_to do |format|
      if @store.update(store_params)
        format.html { redirect_to sales_associate_store_path(sales_associate_id: current_sales_associate, id: @store),
                                  notice: 'Store was successfully updated.' }
        format.json { render :show, status: :ok, location: @store }
      else
        format.html { render :edit }
        format.json { render json: @store.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @store.destroy
    respond_to do |format|
      format.html { redirect_to sales_associate_stores_path(sales_associate: current_sales_associate), notice: I18n.t("sales_associates.stores.destroy") }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_store
    @store = current_sales_associate.all_stores.find(params[:id])
  end

  def store_params
    params.require(:store).permit(:address, :state, :city, :zip_code, :country, :monday, :tuesday, :wednesday, :thursday,
                                  :friday, :saturday, :sunday, :monday_start, :monday_end, :tuesday_start, :tuesday_end,
                                  :wednesday_start, :wednesday_end, :thursday_start, :thursday_end, :friday_start,
                                  :friday_end, :saturday_start, :saturday_end, :sunday_start, :sunday_end,
                                  :brand_id, :logo, :banner,
                                  positions_attributes: [:id, :store_id  , :user_id, :start_date, :end_date,
                                                         :role, :monday, :tuesday, :wednesday, :thursday, :friday,
                                                         :saturday, :sunday, :monday_start, :monday_end, :tuesday_start,
                                                         :tuesday_end, :wednesday_start, :wednesday_end, :thursday_start,
                                                         :thursday_end, :friday_start, :friday_end, :saturday_start,
                                                         :saturday_end , :sunday_start , :sunday_end ])
  end

end
