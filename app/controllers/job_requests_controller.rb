class JobRequestsController < ApplicationController

  def index
  end
  def show
  end

  def create
    @jobrequest = JobRequest.new(jobreq_params)
    @jobrequest.staff_size ||= 1
    @jobrequest.start_time = @jobrequest.start_time.nil? ? DateTime.now + 1.day : DateTime.parse(@jobrequest.start_time)
    @jobrequest.end_time = @jobrequest.start_time + 1.day
    @jobrequest.max_price ||= 1
    if @jobrequest.save
      redirect_to workers_path(staff_size: @jobrequest.staff_size, location: "Paris", position: @jobrequest.position) #rajouter l'argument @jobrequest pour faire passer les params
    else
      render '/'
    end 
  end


  private

  def jobreq_params
    params.require(:job_request).permit(:position)
  end
end
