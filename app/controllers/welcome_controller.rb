class WelcomeController < ApplicationController
  def locate
  end

  def index
    @sales_associate = SalesAssociate.new
  end
end
