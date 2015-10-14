module SalesAssociates::StoresHelper
  def address_format(store)
    "<address>
        <strong>#{ store.brand.name }</strong><br>
        #{ store.address } <br>
        #{store.city }, #{store.state } #{store.zip_code }<br>
        <!--TODO <abbr title=\"Phone\">P:</abbr> (123) 456-7890-->
    </address>"
  end
end
