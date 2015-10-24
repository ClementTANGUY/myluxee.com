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

  def address_format(store, show_brand=true)
    address = "<address>"
    address << "<strong>#{ store.brand.name }</strong><br>" if show_brand
    address << "#{ store.address } <br>
        #{store.city }, #{store.state } #{store.zip_code }<br>
        <!--TODO <abbr title=\"Phone\">P:</abbr> (123) 456-7890-->
    </address>"
    address
  end

  def current_sales_associate?(sales_associate)
    !current_sales_associate.nil? and current_sales_associate.eql?(sales_associate)
  end
end
