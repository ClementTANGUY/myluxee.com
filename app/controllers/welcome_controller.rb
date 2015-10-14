class WelcomeController < ApplicationController
  before_action :require_no_user
  def locate
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
