class AirportsController < ApplicationController
  require 'csv'
  require 'crack/json'
  before_action :set_airport, only: [:show, :edit, :update, :destroy]

  # GET /airports
  # GET /airports.json
  def index
    @airports = Airport.paginate(:page => params[:page], :per_page => 30)
    
    respond_to do |format|
      format.html {  }
      format.csv { send_data @airports.to_csv }
    end
  end

  # GET /airports/1
  # GET /airports/1.json
  def show
    lat = @airport.latitude_deg
    lng = @airport.longitude_deg
    
    @map_markers = Gmaps4rails.build_markers(@airport) do |airport,marker|
       marker.lat lat
       marker.lng lng
    end
      response = RestClient.get "http://api.openweathermap.org/data/2.5/weather", :params => {:lat => lat, :lon => lng}
     @weather = Crack::JSON.parse(response.body) 
  end

  # GET /airports/new
  def new
    @airport = Airport.new
  end

  # GET /airports/1/edit
  def edit
  end

  # POST /airports
  # POST /airports.json
  def create
    @airport = Airport.new(airport_params)

    respond_to do |format|
      if @airport.save
        format.html { redirect_to @airport, notice: 'Airport was successfully created.' }
        format.json { render action: 'show', status: :created, location: @airport }
      else
        format.html { render action: 'new' }
        format.json { render json: @airport.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /airports/1
  # PATCH/PUT /airports/1.json
  def update
    respond_to do |format|
      if @airport.update(airport_params)
        format.html { redirect_to @airport, notice: 'Airport was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @airport.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /airports/1
  # DELETE /airports/1.json
  def destroy
    @airport.destroy
    respond_to do |format|
      format.html { redirect_to airports_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_airport
      @airport = Airport.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def airport_params
      params.require(:airport).permit(:ident, :airport_type, :name, :latitude_deg, :longitude_deg, :elevation_ft, :continent, :iso_country, :iso_region, :municipality, :scheduled_service, :gps_code, :iata_code, :local_code, :home_link, :wikipedia_link, :keywords)
    end
end
