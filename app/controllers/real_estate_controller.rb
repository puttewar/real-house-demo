class RealEstateController < ApplicationController

  load_and_authorize_resource
  before_action :authenticate_user!, only: [:buy, :new]
  before_action :set_real_eastate, only: [:show, :buy]
  
  def index
    @real_estate = RealEstate.all
  end

  def new
    @real_estate = RealEstate.new
  end

  def create
    @real_estate = RealEstate.new(real_estate_params)
    respond_to do |format|
      if @real_estate.save
        format.html { redirect_to real_estate_path(@real_estate), notice: 'Real estate was successfully created.' }
        format.json { render :show, status: :created, location: @real_estate }
      else
        format.html { render :new }
        format.json { render json: @real_estate.errors, status: :unprocessable_entity }
      end
    end
  end

  def buy
    LongTaskJob.perform_later(params[:id], current_user.id)
    flash.now[:notice] = "We got your reequest, a confirmation email will be send to your email id"
    redirect_to real_estate_path(@real_estate)
  end

  private

    def set_real_eastate
      @real_estate = RealEstate.find(params[:id])
    end

    def real_estate_params
      params.require(:real_estate).permit(:owner, :address, :rooms, :sqmt, :floors, :air_condition, :price, :units, :shops, :parking, :type, images: [])
    end

end
