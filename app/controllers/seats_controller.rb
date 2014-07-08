class SeatsController < ApplicationController
  def index
    @tables = Table.find(params[:table_id])
    @seats = Seat.where(:table => @tables)
  end
end
