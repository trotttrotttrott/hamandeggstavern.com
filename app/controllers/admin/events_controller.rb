class Admin::EventsController < Admin::BaseController

  def index
    @events = Event.page(params[:page])
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
    @event = Event.create(params[:event])
    if @event.persisted?
      redirect_to admin_events_path, notice: 'Event was successfully created.'
    else
      @acts = Act.all
      render action: 'new'
    end
  end

  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(params[:event])
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
end
