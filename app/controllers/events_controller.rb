class EventsController < ApplicationController

  def create
    @event = Event.new(permitted_params.event)

    if @event.save
      i = 0
      while i < @event.num_of_tables
        i += 1
        t = Table.create(:table_number => "#{@event.id}-#{i}", :max_seats => @event.max_seats, :event => @event)
        j = 0
        while j < @event.max_seats
          Seat.create(:occupied => false, :table => t)
          j += 1
        end
      end
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

  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    redirect_to events_path
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    prev_tables = @event.tables.size

    if @event.update(permitted_params.event)
      i = prev_tables
      while i < (@event.num_of_tables + prev_tables)
        i += 1
        t = Table.create(:table_number => "#{@event.id}-#{i}", :max_seats => @event.max_seats, :event => @event)
        j = 0
        while j < @event.max_seats
          Seat.create(:occupied => false, :table => t)
          j += 1
        end
      end
      redirect_to event_path(@event)
    end
  end
end
