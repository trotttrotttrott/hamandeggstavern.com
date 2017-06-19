class Public::HomeController < Public::BaseController

  def index
    @patron = Patron.new
    @acts = Act.all
    @events = Event.where('date >= ?', Date.today)
    @wines = Wine.all
    @shit_cans = Beer.shit_cans
    @drafts = Beer.drafts
    @craft_cans = Beer.craft_cans
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
