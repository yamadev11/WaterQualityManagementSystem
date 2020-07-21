class DashboardController < ApplicationController
  def index
    @readings = Reading.all
  end

  def charts
    if params[:location]
      @node = Node.where(location: params[:location])[0]
      @from = params[:from]
      @to = params[:to]
    else
      @node = Node.first
      @from = Date.today
      @to = Date.today
    end
  end
end
