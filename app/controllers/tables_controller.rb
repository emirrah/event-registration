
class TablesController < ApplicationController

  def create
    @table = Table.new(permitted_params.table)

    if @table.save
      redirect_to tables_path
    else
      render 'new'
    end
  end

  def index
    @tables = Table.all
  end

  def new
    @table = Table.new
    # head :created
  end

  def show
    @table = Table.find(params[:id])
  end
end
