module SalesAssociatesHelper
  def sales_associate
    @sales_associate||resource
  end

  def store_position_format(position)
    format = "<strong>#{ position.store.brand.name }</strong> - #{position.store.brand.speciality}<br>
        <small>#{ position.store.address } #{position.store.city }, #{position.store.state } #{position.store.zip_code }</small<br>"
    format << "since #{position.start_date} "
    format << "to #{position.end_date} " if position.end_date
    format << "<br/>"
    format << "as a #{position.role}"
    format
  end

  def format_position(position)
    unless position.nil?
      format = "<strong>#{link_to( position.store.brand.name, position.store)}</strong>  - #{position.store.brand.speciality} "
      format << "(since #{position.start_date.strftime("%d/%m/%Y")})<br/>"
      format << "<small>#{ position.store.address } #{position.store.city }, #{position.store.state } #{position.store.zip_code }</small><br>"
      format
    end
  end
end
