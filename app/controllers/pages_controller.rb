class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  
  def home
    @jobrequest = JobRequest.new
  end
end
