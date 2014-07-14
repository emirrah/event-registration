class TablesController < ApplicationController

  def create
    @table = Table.new(permitted_params.table)

    if @table.save
      i = 0
      while i < @table.max_seats do
        Seat.create(:occupied => false, :table => @table)
      end

      redirect_to events_path
    else
      render 'new'
    end
  end

  def index
    @tables = Table.all
  end

  def new
    @table = Table.new
  end

  def show
    @table = Table.find(params[:id])
  end

  def update
    @table = Table.find(params[:id])
    old_event = @table.event_id

    if @table.seats.where(:occupied => true).size <= 0
      @table.destroy
      @table.save
    end

    redirect_to event_path(old_event)
  end
end
