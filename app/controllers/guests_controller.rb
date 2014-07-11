class GuestsController < ApplicationController
  def index
    @guests = Guest.where(:event_id => params[:event_id])
  end

  def new
    @available_seats = 0

    tables = Table.where(:event_id => params[:event_id])
    tables.each do |t|
    seats = Seat.where(:occupied => false, :table_id => t.id)
      seats.each do |s|
        if t.id == s.table_id
          @available_seats += 1
        end
      end
    end
    @guest = Guest.new
  end

  def create
    @guest = Guest.new(permitted_params.guest)
    @guest.event_id = params[:event_id]

    if @guest.save
      tables = Table.where(:event_id => params[:event_id])
      assigned = 0
      tables.each do |t|
        seats = Seat.where(:occupied => false, :table_id => t.id)
        seats.each do |s|
          if assigned < @guest.num_of_seats
            s.occupied = true
            s.guest_id = @guest.id
            s.table_id = t.id
            s.save
            assigned += 1
          end
        end
      end

      redirect_to event_guests_path
    else
      render 'new'
    end
  end

  def show
    @guest = Guest.find(params[:id])
  end

  def edit
    @guest = Guest.find(params[:id])

    @available_seats = 0

    tables = Table.where(:event_id => params[:event_id])
    tables.each do |t|
    seats = Seat.where(:occupied => false, :table_id => t.id)
      seats.each do |s|
        if t.id == s.table_id
          @available_seats += 1
        end
      end
    end
  end

  def update
    @guest = Guest.find(params[:id])

    puts "guest >> #{@guest.as_json}\n\n"

    puts "seat size >>> #{@guest.seats.size}\n"

    if @guest.update(permitted_params.guest)
      tables = Table.where(:event_id => params[:event_id])
      assigned = 0
      tables.each do |t|
        if assigned < @guest.num_of_seats
          seats = Seat.where(:occupied => false, :table_id => t.id)
          seats.each do |s|
            s.occupied = true
            s.guest_id = @guest.id
            s.table_id = t.id
            s.save
            assigned += 1
          end
        end
      end
      redirect_to event_guests_path(@guest.event_id)
    else
      render 'edit'
    end
  end

end
