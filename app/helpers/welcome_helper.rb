module WelcomeHelper
  def image_icon_data_content(img, name)
    "#{image_tag img, class:'img-circle img-responsive'}
            <h4>#{name}</h4>
            <p class='text-muted'>english, polish
            <br>Today : 11.00 - 19.00
            </p>"
  end

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
