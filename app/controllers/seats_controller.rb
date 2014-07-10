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
end
