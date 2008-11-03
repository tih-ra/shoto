class Manage::EventsController < Manage::MainController
  before_filter :find_event, :only=>[:destroy, :edit, :update]
  before_filter :login_required
  def index
    @events = Event.paginate(:page => params[:page], :per_page => 15, :order=>"start_at DESC")
  end
  def create
    @event = Event.new(params[:event])
    @event.save
    redirect_to manage_events_path
  end
  def destroy
    @event.destroy
    redirect_to manage_events_path
  end
  def update
    @event.update_attributes(params[:event])
    @event.post_ids = params[:event][:post_ids]
    @event.save!
    redirect_to manage_events_path
  end
  private
  def find_event
    @event = Event.find(params[:id])
  end
end
