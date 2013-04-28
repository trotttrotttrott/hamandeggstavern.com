class Admin::ActsController < Admin::BaseController

  def index
    @acts = Act.all
  end

  def show
    @act = Act.find(params[:id])
  end

  def new
    @act = Act.new
  end

  def edit
    @act = Act.find(params[:id])
  end

  def create
    @act = Act.new(params[:act])
    if @act.save
      redirect_to admin_acts_path, notice: 'Act was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    @act = Act.find(params[:id])
    if @act.update_attributes(params[:act])
      redirect_to admin_acts_path, notice: 'Act was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @act = Act.find(params[:id])
    @act.destroy
    redirect_to admin_acts_path
  end
end