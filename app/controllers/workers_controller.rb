class WorkersController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_worker, only: [:edit, :show]

  def index
    @workers = User.where(on_duty: true).where(address: params[:location]).where(position: params[:position])
  # Compléter avec la date demandée par l'employeur.
  end

  def show
    events = []
    @worker.bookings.future.each do |booking|
      events <<  "{ date: '#{booking.job_request.start_time.to_date}', title: \"#{booking.facility.name}\", url: '#{facility_url(booking.facility)}', location: \"#{booking.facility.address}\", contact: \"#{booking.facility.user.full_name}\" }"
    end
    @json_events = "[#{events.join(', ')}]"
    puts @json_events
  end

  def edit
  end

  def update
    @worker = User.find(current_user)
    @worker.min_wage = (account_update_params[:min_wage].to_i * 100)
    if params[:user][:description] == ""
    else
      @worker.update(description: params[:user][:description])
    end
    @worker.update(account_update_params)

    if @worker.update(account_update_params)
    # no need for app/views/users/update.html.erb

      redirect_to worker_path(@worker)
    else
      render :new
    end

  end

  private

  def set_worker
    @worker = User.find(params[:id])
  end

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :photo, :photo_cache, :position)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :photo, :photo_cache, :position, :birth_place, :min_wage, :address, :mobility_radius, :email, :on_duty, :position, :social_security_number, :telephone)
  end



end
