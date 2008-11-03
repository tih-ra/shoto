class EventsController < ApplicationController
  def index
    @events = Event.paginate(:page => params[:page], :per_page => 25, :order=>"start_at DESC")
  end
end
