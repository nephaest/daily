class JobRequestsController < ApplicationController

  def index
  end
  def show
  end

  def create
    @jobrequest = JobRequest.new(jobreq_params)
    if @jobrequest.save
      redirect_to workers_path
    else
      render '/'
    end 
  end


  private

  def jobreq_params
    params.require(:job_request).permit(:position)
  end
end
