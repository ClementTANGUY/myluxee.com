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

  def address_format(store)
    "<address>
        <strong>#{ store.brand.name }</strong><br>
        #{ store.address } <br>
        #{store.city }, #{store.state } #{store.zip_code }<br>
        <!--TODO <abbr title=\"Phone\">P:</abbr> (123) 456-7890-->
    </address>"
  end
end
