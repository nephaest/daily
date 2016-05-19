class JobRequestsController < ApplicationController
  skip_before_action :authenticate_user!, only: :create

  def index
  end
  def show
  end

  def create
    if jobreq_params[:position] == "" || jobreq_params[:location] == ""
      redirect_to workers_path
    else
      @jobrequest = JobRequest.new(jobreq_params)
      @jobrequest.staff_size ||= 1
      @jobrequest.start_time ||= DateTime.now + 1.day
      @jobrequest.end_time = @jobrequest.start_time + 1.day
      @jobrequest.max_price ||= 1
      if @jobrequest.save
        session[:jobrequest_id] = @jobrequest.id
        session[:jobrequest_start] = @jobrequest.start_time
        session[:jobrequest_position] = @jobrequest.position
        session[:jobrequest_location] = @jobrequest.location
        session[:jobrequest_staff_size] = @jobrequest.staff_size
        redirect_to workers_path(staff_size: @jobrequest.staff_size, location: @jobrequest.location, position: @jobrequest.position) #rajouter l'argument @jobrequest pour faire passer les params
      else
        render '/'
      end
    end
  end


  private

  def jobreq_params
    params.require(:job_request).permit(:position, :location, :start_time)
  end
end
