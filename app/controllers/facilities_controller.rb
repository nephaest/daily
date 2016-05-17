class FacilitiesController < ApplicationController
  before_action :set_facility, only: [:edit, :update, :destroy]
  
  def index
    @facilities = Facility.all
  end

  def show
  end

  def new
    @facility = Facility.new
  end

  def create
    @facility = Facility.new(facility_params)
    @facility.user = current_user
    if @facility.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @facility.update(facility_params)
      redirect_to facility_path(@facility)
    else
      render :edit
  end

  private

  def set_facility
    @facility = Facility.find(params[:id])
  end

  def facility_params
    params.require(:facility).permit(:siret, :name, :creation_date, :address, :size, :category, :website_url, :description)
  end
end
