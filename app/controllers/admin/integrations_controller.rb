class Admin::IntegrationsController < Admin::BaseController
  def index
    @integrations = Integration.all
  end
end
