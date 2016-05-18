class WorkersController < ApplicationController

  def index
    # @workers = User.all
    @workers = User.where(on_duty: true).where(address: params[:location]).where(position: params[:position])
  # Compléter avec la date demandée par l'employeur.
  end
end
