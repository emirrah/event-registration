class GuestsController < ApplicationController
  def index
    @guests = Guest.all
    @seat = Seat.new
  end

  def new
    @guest = Guest.new
  end

  def create
    @guest = Guest.new(permitted_params.guest)

    if @guest.save
      table = Table.where(:event => @event)
      Seat.update
      redirect_to
    else
      render 'new'
    end
  end

end
