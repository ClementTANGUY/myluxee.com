class SalesAssociatesController < ApplicationController
  before_action :set_sales_associate, only: [:show, :edit, :update, :destroy]

  def wizard_create
    @sales_associate = SalesAssociate.new(sales_associate_params)
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
  end

  # GET /sales_associates/1/edit
  def edit
  end

  # POST /sales_associates
  # POST /sales_associates.json
  def create
    @sales_associate = SalesAssociate.new(sales_associate_params)

    respond_to do |format|
      if @sales_associate.save
        format.html { redirect_to @sales_associate, notice: 'Sales associate was successfully created.' }
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
    respond_to do |format|
      if @sales_associate.update(sales_associate_params)
        format.html { redirect_to @sales_associate, notice: 'Sales associate was successfully updated.' }
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
    @sales_associate.destroy
    respond_to do |format|
      format.html { redirect_to sales_associates_url, notice: 'Sales associate was successfully destroyed.' }
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
      params.require(:sales_associate).permit(:first_name, :last_name, :email, :be_contacted, :be_rated, :password, :password_confirmation)
    end
end
