class BookingsController < ApplicationController
  def index
    @bookings = Booking.where(facility_id: find_booking_by_owner)
  end
  def show
    @bookings =  Booking.find_by_facility_id(find_booking_by_owner)
  end
  def create
    @booking = Booking.new
    @booking.final_price ||= 1
    @booking.facility = current_user.facilities.first
    @booking.job_request = JobRequest.find(session[:jobrequest_id])
    @booking.user = User.find(params[:worker_id])
    @booking.status = 'pending'

    if @booking.save

      redirect_to worker_path(@booking.user)
    else
      # mettre message d'erreur et le retourner sur le worker_path.
    end
  end

  def destroy
    Booking.find(params[:id]).delete
    redirect_to worker_bookings_path(params[:worker_id]) #trouver une solution pour rediriger
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(status: params[:status])
    respond_to do |format|
      format.html { redirect_to worker_path(@booking.user) }
      format.js  # <-- will render `app/views/bookings/update.js.erb`
    end
  end

  private

  def find_booking_by_owner
    u = User.find(params[:worker_id])
    u = current_user
    p "USER"
    p u.id
    f = Facility.find_by user_id: u.id
    return f.id
  end



  # def booking_param
  #   params.require(:bookings).permit(:worker_id)
  # end
end
