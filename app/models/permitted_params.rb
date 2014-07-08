class PermittedParams < Struct.new(:params)
  def event
    params.require(:event).permit(*event_attributes)
  end

  def event_attributes
    [:event_name]
  end
end
