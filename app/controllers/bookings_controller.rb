class BookingsController < ApplicationController

  def create
    @booking = Booking.new
    @booking.final_price ||= 1
    @booking.facility = current_user.facilities.first
    @booking.job_request = JobRequest.find(session[:jobrequest_id])
    @booking.user = User.find(params[:worker_id])
    if @booking.save
      redirect_to worker_path(@booking.user)
    else
      raise
    end
  end


  private

  # def booking_param
  #   params.require(:bookings).permit(:worker_id)
  # end
end
