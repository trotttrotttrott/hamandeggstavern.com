class Public::HomeController < Public::BaseController

  def index

    @patron = Patron.new
    @acts = Act.all
    @events = Event.where('date >= ?', Date.today)

    @wines = Wine.all
    @wine_price = Wine::PRICE

    @shit_cans = Beer.shit_cans
    @shit_can_price = Beer::PRICES[:shit_can]

    @drafts = Beer.drafts
    @draft_price = Beer::PRICES[:draft]

    @craft_cans = Beer.craft_cans
    @craft_can_price = Beer::PRICES[:craft_can]
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
