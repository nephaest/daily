class WorkersController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @workers = User.where(on_duty: true).where(address: params[:location]).where(position: params[:position])
  # Compléter avec la date demandée par l'employeur.
  end

  def show
    @worker = User.find(params[:id])
  end

  def edit
    @worker = User.find(params[:id])
  end

  def update

    @worker = User.find(current_user)
    if params[:user][:description] == ""
    else
      @worker.update(description: params[:user][:description])
    end
    @worker.update(account_update_params)
    # no need for app/views/users/update.html.erb
    redirect_to worker_path(@worker)
  end

  private

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :photo, :photo_cache, :position)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :photo, :photo_cache, :position, :birth_place, :min_wage, :address, :mobility_radius, :email, :on_duty, :position, :social_security_number, :telephone)
  end



end
