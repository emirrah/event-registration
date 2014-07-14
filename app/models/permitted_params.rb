class PermittedParams < Struct.new(:params)
  def event
    params.require(:event).permit(*event_attributes)
  end

  def event_attributes
    [
      :event_name,
      :num_of_tables,
      :max_seats,
      :date
    ]
  end

  def table
    params.require(:table).permit(*table_attributes)
  end

  def table_attributes
    [
      :max_seats
    ]
  end

  def guest
    params.require(:guest).permit(*guest_attributes)
  end

  def guest_attributes
    [
      :name,
      :num_of_seats
    ]
  end
end
