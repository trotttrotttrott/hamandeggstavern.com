class Admin::EventsController < Admin::BaseController

  def index
    @events = Event.where('date >= ?', Date.today)
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
    @acts = Act.all
  end

  def edit
    @event = Event.find(params[:id])
    @acts = Act.all
  end

  def create
    @event = Event.create(event_params)
    if @event.persisted?
      redirect_to admin_events_path, notice: 'Event was successfully created.'
    else
      @acts = Act.all
      render action: 'new'
    end
  end

  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(event_params)
      redirect_to admin_events_path, notice: 'Event was successfully updated.'
    else
      @acts = Act.all
      render action: 'edit'
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to admin_events_url
  end

  def event_params
    params.require(:event).permit!
  end
end
