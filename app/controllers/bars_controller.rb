class BarsController < ApplicationController
  before_action :set_bar, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:create, :edit, :update, :destroy]

  skip_authorize_resource only: [:map_location, :map_locations]

  # GET /bars
  # GET /bars.json
  def index
    @bars = Bar.all
    if params[:search]
      @bars = Bar.search(params[:search])

    end
  end

  # GET /bars/1
  # GET /bars/1.json
  def show
    g = https://maps.googleapis.com/maps/api/geocode/json?latlng=40.714224,-73.961452&key=YOUR_API_KEY

  end

  def map_location
    @bar = Bar.find(params[:bar_id])
    @hash = Gmaps4rails.build_markers(@bar) do |bar, marker|
      marker.lat(bar.latitude)
      marker.lng(bar.longitude)
    end
    render json: @hash.to_json
  end

  def map_locations
    @bars = Bar.all
    if params[:search]
      @bars = Bar.search(params[:search])
    end
    if @bars.length < 1
      @bars = []
    end

    @hash = Gmaps4rails.build_markers(@bars) do |bar,marker|
      marker.lat(bar.latitude)
      marker.lng(bar.longitude)
      marker.infowindow("<a href='/bars/#{bar.id}'>#{bar.name}</a>")

    end
    render json: @hash.to_json
  end

  # GET /bars/new
  def new
    @bar = Bar.new
  end

  # GET /bars/1/edit
  def edit
  end

  # POST /bars
  # POST /bars.json
  def create
    @bar = Bar.new(bar_params)

    respond_to do |format|
      if @bar.save
        format.html { redirect_to @bar, notice: 'Bar was successfully created.' }
        format.json { render :show, status: :created, location: @bar }
      else
        format.html { render :new }
        format.json { render json: @bar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bars/1
  # PATCH/PUT /bars/1.json
  def update
    respond_to do |format|
      if @bar.update(bar_params)
        format.html { redirect_to @bar, notice: 'Bar was successfully updated.' }
        format.json { render :show, status: :ok, location: @bar }
      else
        format.html { render :edit }
        format.json { render json: @bar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bars/1
  # DELETE /bars/1.json
  def destroy
    @bar.destroy
    respond_to do |format|
      format.html { redirect_to bars_url, notice: 'Bar was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bar
      @bar = Bar.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bar_params
      params.require(:bar).permit(:name, :street, :city, :state, :zip)
    end
end
