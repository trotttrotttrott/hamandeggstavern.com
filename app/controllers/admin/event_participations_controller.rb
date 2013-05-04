class Admin::EventParticipationsController < Admin::BaseController

  def index
    @event_participations = EventParticipation.page(params[:page])
  end

  def show
    @event_participation = EventParticipation.find(params[:id])
  end

  def new
    @event_participation = EventParticipation.new
    @acts = Act.all
    @events = Event.all
  end

  def edit
    @event_participation = EventParticipation.find(params[:id])
    @acts = Act.all
    @events = Event.all
  end

  def create
    @event_participation = EventParticipation.new(params[:event_participation])
    if @event_participation.save
      redirect_to admin_event_participations_path, notice: 'Event participation was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @event_participation = EventParticipation.find(params[:id])
    if @event_participation.update_attributes(params[:event_participation])
      redirect_to admin_event_participations_path, notice: 'Event participation was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @event_participation = EventParticipation.find(params[:id])
    @event_participation.destroy
    redirect_to admin_event_participations_url
  end
end
