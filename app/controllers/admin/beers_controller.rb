class Admin::BeersController < Admin::BaseController

  def index
    @beers = Beer.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @beers }
    end
  end

  def show
    @beer = Beer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @beer }
    end
  end

  def edit
    @beer = Beer.find(params[:id])
  end

  def new
    @beer = Beer.new
  end

  def create
    @beer = Beer.new(beer_params)

    respond_to do |format|
      if @beer.save
        format.html { redirect_to admin_beer_path(@beer), notice: 'Beer was successfully created.' }
        format.json { render json: @beer, status: :created, location: @beer }
      else
        format.html { render action: "new" }
        format.json { render json: @beer.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @beer = Beer.find(params[:id])

    respond_to do |format|
      if @beer.update_attributes(beer_params)
        format.html { redirect_to admin_beer_path(@beer), notice: 'Beer was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @beer.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @beer = Beer.find(params[:id])
    @beer.destroy

    respond_to do |format|
      format.html { redirect_to admin_beers_path }
      format.json { head :ok }
    end
  end

  private

  def beer_params
    params.require(:beer).permit!
  end
end
