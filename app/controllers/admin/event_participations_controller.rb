class Admin::EventParticipationsController < Admin::BaseController

  def destroy
    @event_participation = EventParticipation.find(params[:id])
    @event_participation.destroy
    render :nothing => true
  end
end
