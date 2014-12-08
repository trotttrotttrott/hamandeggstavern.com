class Admin::PatronsController < Admin::BaseController
  def index
    @admin_patrons = Patron.all
  end
end
