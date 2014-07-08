class EventsController < ApplicationController
  # load_and_authorize_resource

  def create
    @event = Event.new(permitted_params.event)

    if @event.save
      redirect_to events_path
    else
      render 'new'
    end
  end

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
    # head :created
  end

  def show
    @event = Event.find(params[:id])
  end
end
