class Public::HomeController < Public::BaseController

  def index
    @patron = Patron.new
    @events = Event.where "start > :start", :start => 2.weeks.ago
  end

  def create
    @patron = Patron.new(patron_params)
    status = @patron.save ? 200 : 406
    if request.xhr?
      render :partial => 'public/home/index/form', :status => status
    else
      render :index
    end
  end

  private

  def patron_params
    params.require(:patron).permit(:email)
  end
end
