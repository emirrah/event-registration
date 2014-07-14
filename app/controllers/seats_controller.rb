class SeatsController < ApplicationController
  def index
    @table = Table.find(params[:table_id])
    @seats = Seat.where(:table_id => params[:table_id])
  end

  def new
    @seat = Seat.new
  end

  def create
    @seat = Seat.new(permitted_params.seat)

    if @seat.save
      redirect_to event_path
    else
      render 'new'
    end
  end

  def update
    @seat = Seat.find(params[:id])
    old_guest = @seat.guest_id

    if @seat
      @seat.occupied = false
      @seat.guest_id = nil
      @seat.save

      redirect_to event_guest_path(params[:event_id], old_guest)
    end
  end
end
