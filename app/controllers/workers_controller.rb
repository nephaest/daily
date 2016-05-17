class WorkersController < ApplicationController

  def index
    @workers = User.all
    # @workers = User.where(on_duty: true)\
    #   .where('location LIKE %?%', params[:location])\
    #   .where('position LIKE %?%', params[:position])
  # Compléter avec la date demandée par l'employeur.
  end
end
