module ApplicationHelper
  def resource_name
    @resource.class.name.underscore
  end

  def resource
    @resource
  end

  def devise_mapping
    @devise_mapping
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

  def time_format(week_name, open, time_start, time_end, today)
    time = "<span class=\"glyphicon glyphicon-time\"></span> "
    time << week_name
    time <<  " - "
    if open
      time << "#{time_start} - #{time_end}"
    else
      time << t("stores.helper.closed")
    end
    if today
      return "<strong>#{time}</strong>"
    else
      return time
    end
  end


  def time_format_small(week_name, open, time_start, time_end, today)
    if open
      time = "<span class=\"glyphicon glyphicon-time\"></span> "
      time << week_name
      time <<  " - #{time_start} - #{time_end}"
      if today
        return "<strong>#{time}</strong>"
      else
        return time
      end
    end
  end

  def my_time_format(week_name, open, time_start, time_end, today)
    time = "<span class=\"glyphicon glyphicon-time\"></span> "
    time << week_name
    time <<  " - "
    if open
      time << "#{time_start} - #{time_end}"
    else
      time << t("sales_associates.helper.closed")
    end
    if today
      time = "<strong>#{time}</strong>"
    end
    "#{time}<br/>"
  end
end
