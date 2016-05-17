class PagesController < ApplicationController
  def home
    @jobrequest = JobRequest.new
  end
end
