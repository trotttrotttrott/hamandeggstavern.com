class Admin::PatronsController < Admin::BaseController
  # GET /admin/patrons
  # GET /admin/patrons.json
  def index
    @admin_patrons = Patron.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @admin_patrons }
    end
  end

  # GET /admin/patrons/1
  # GET /admin/patrons/1.json
  def show
    @admin_patron = Patron.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @admin_patron }
    end
  end

  # GET /admin/patrons/new
  # GET /admin/patrons/new.json
  def new
    @admin_patron = Patron.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @admin_patron }
    end
  end

  # GET /admin/patrons/1/edit
  def edit
    @admin_patron = Patron.find(params[:id])
  end

  # POST /admin/patrons
  # POST /admin/patrons.json
  def create
    @admin_patron = Patron.new(params[:patron])

    respond_to do |format|
      if @admin_patron.save
        format.html { redirect_to admin_patron_path(@admin_patron), notice: 'Patron was successfully created.' }
        format.json { render json: @admin_patron, status: :created, location: @admin_patron }
      else
        format.html { render action: "new" }
        format.json { render json: @admin_patron.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /admin/patrons/1
  # PUT /admin/patrons/1.json
  def update
    @admin_patron = Patron.find(params[:id])

    respond_to do |format|
      if @admin_patron.update_attributes(params[:patron])
        format.html { redirect_to admin_patron_path(@admin_patron), notice: 'Patron was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @admin_patron.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/patrons/1
  # DELETE /admin/patrons/1.json
  def destroy
    @admin_patron = Patron.find(params[:id])
    @admin_patron.destroy

    respond_to do |format|
      format.html { redirect_to admin_patrons_url }
      format.json { head :ok }
    end
  end
end
