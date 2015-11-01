class WelcomeController < ApplicationController
  before_action :require_no_user
  def locate
    @country = params[:country]
    @city = params[:city]
    @stores = Store.includes(:brand).where({country: @country, city: @city}).order("brands.name")
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
  end

  def index
    @sales_associate = SalesAssociate.new
  end

  def terms_and_conditions

  end

  def privacy_policy

  end

  private

  def require_no_user
    if signed_in?
      redirect_to current_sales_associate
    end
  end
end
