class Admin::WinesController < Admin::BaseController

  def index
    @wines = Wine.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @wines }
    end
  end

  def show
    @wine = Wine.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @wine }
    end
  end

  def edit
    @wine = Wine.find(params[:id])
  end

  def new
    @wine = Wine.new
  end

  def create
    @wine = Wine.new(wine_params)

    respond_to do |format|
      if @wine.save
        format.html { redirect_to admin_wine_path(@wine), notice: 'Wine was successfully created.' }
        format.json { render json: @wine, status: :created, location: @wine }
      else
        format.html { render action: "new" }
        format.json { render json: @wine.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @wine = Wine.find(params[:id])

    respond_to do |format|
      if @wine.update_attributes(wine_params)
        format.html { redirect_to admin_wine_path(@wine), notice: 'Wine was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @wine.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @wine = Wine.find(params[:id])
    @wine.destroy

    respond_to do |format|
      format.html { redirect_to admin_wines_path }
      format.json { head :ok }
    end
  end

  private

  def wine_params
    params.require(:wine).permit!
  end
end
