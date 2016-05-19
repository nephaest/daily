class FacilitiesController < ApplicationController
  before_action :set_facility, only: [:edit, :show, :update, :destroy]

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
      redirect_to facility_path(@facility)
    else
      render :new
    end
  end

  def edit
    @facility = Facility.find(params[:id])
  end

  def update
    if @facility.update(facility_params)
      redirect_to facility_path(@facility)
    else
      render :edit
    end
  end

  private

  def set_facility
    @facility = Facility.find(params[:id])
  end

  def facility_params
    params.require(:facility).permit(:siret, :photo, :id, :name, :creation_date, :address, :size, :category, :website_url, :description)
  end
end
