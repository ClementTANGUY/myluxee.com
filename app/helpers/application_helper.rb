module ApplicationHelper
  def resource_name
    :sales_associate
  end

  def resource
    @resource ||= SalesAssociate.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:sales_associate]
  end
end
