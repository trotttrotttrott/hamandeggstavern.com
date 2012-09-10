class Public::HomeController < Public::BaseController

  def index
    @patron = Patron.new
  end

  def create
    @patron = Patron.new(params[:patron])
    @patron.save
    if request.xhr?
      render :partial => 'public/home/index/form'
    else
      render :index
    end
  end
end
