module SalesAssociatesHelper
  def sales_associate
    @sales_associate||resource
  end

  def store_position_format(position)
    format = address_format position.store
    format << "from #{position.start_date} "
    format << "to #{position.end_date} " if position.end_date
    format << "<br/>"
    format << "as a #{position.role}"
    format
  end
end
