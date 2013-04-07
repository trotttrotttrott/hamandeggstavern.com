class Public::HomeController < Public::BaseController

  def index
    @patron = Patron.new
    facebook_service = FacebookService.new
    @tracks = facebook_service.music_listens
  end

  def create
    @patron = Patron.new(params[:patron])
    status = @patron.save ? 200 : 406
    if request.xhr?
      render :partial => 'public/home/index/form', :status => status
    else
      render :index
    end
  end
end
