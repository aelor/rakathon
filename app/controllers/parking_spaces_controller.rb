require 'rqrcode'
class ParkingSpacesController < ApplicationController
  before_action :set_owner, only: [:show, :edit, :update, :destroy]

  # GET /parking_spaces
  # GET /parking_spaces.json
  def index
    @parking_spaces = ParkingSpace.all
  end

  # GET /parking_spaces/1
  # GET /parking_spaces/1.json
  def show
  end

  # GET /parking_spaces/new
  def new
    @parking_space = ParkingSpace.new
  end

  # GET /parking_spaces/1/edit
  def edit
  end

  def get_parking_space
    params[:id] = 4
    @qr = RQRCode::QRCode.new( SecureRandom.hex(2), size: 4)
    @user = User.where(id: params[:id]).first if params[:id]
    if @user
      @parking_lists = @user.parking_spaces
    end
     render template: "/parking_spaces/parking_space_list"  
  end
  # POST /parking_spaces
  # POST /parking_spaces.json
  def create
    @parking_space = ParkingSpace.new(owner_params)

    respond_to do |format|
      if @parking_space.save
        format.html { redirect_to @parking_space, notice: 'ParkingSpace was successfully created.' }
        format.json { render :show, status: :created, location: @parking_space }
      else
        format.html { render :new }
        format.json { render json: @parking_space.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /parking_spaces/1
  # PATCH/PUT /parking_spaces/1.json
  def update
    respond_to do |format|
      if @parking_space.update(owner_params)
        format.html { redirect_to @parking_space, notice: 'ParkingSpace was successfully updated.' }
        format.json { render :show, status: :ok, location: @parking_space }
      else
        format.html { render :edit }
        format.json { render json: @parking_space.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parking_spaces/1
  # DELETE /parking_spaces/1.json
  def destroy
    @parking_space.destroy
    respond_to do |format|
      format.html { redirect_to owners_url, notice: 'ParkingSpace was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_owner
      @parking_space = ParkingSpace.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def owner_params
      params.require(:owner).permit(:name, :address, :mobile, :no_of_parking, :price, :latitude, :longitude)
    end
end
