class WelcomeController < ApplicationController
  before_action :require_no_sales_associate, only: [:index, :locate]
  def locate
    session[:place] = @place = params[:place] || session[:place]
    @stores = Store.includes(:brand).where("LOWER(city) = LOWER(?) or LOWER(country) = LOWER(?)", @place, @place).order("brands.name")
    if session[:brand] = @brand = params[:brand] || session[:brand] and !@brand.blank?
      @stores = @stores.where("brands.id = ?", @brand)
    end
    if session[:speciality] = @speciality = params[:speciality] || session[:speciality] and !@speciality.blank?
      @stores = @stores.where("brands.speciality = ?", @speciality)
    end
    if session[:address] = @address = params[:address] || session[:address] and !@address.blank?
      @stores = @stores.where(["LOWER(address) like LOWER(?)", "%#{@address}%" ])
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

  def require_no_sales_associate
    if sales_associate_signed_in?
      redirect_to current_sales_associate
    end
  end
end
