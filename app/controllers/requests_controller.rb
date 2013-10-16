class RequestsController < ApplicationController
  def index
    # Get all requests
    @request = Request.all
  end

  def new
    @request = Request.new
  end

  def create
    # Store new request into the database
    request = Request.new
    request.user = User.find_by_name("John Doe") # Placeholder
    request.title = params[:title]
    request.date = params[:date]
    request.save
  end
end
