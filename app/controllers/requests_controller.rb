class RequestsController < ApplicationController
  def index
    # Get all requests
    @requests = Request.all
  end

  def show
    # No view available (yet)
  end

  def new
    @request = Request.new
  end

  def create
    # Store new request into the database
    @request = Request.new
    @request.user = User.first
    @request.title = params[:title]
    @request.date = params[:date]

    if @request.save
      # Redirect to index function on success
      redirect_to :action => 'index', notice: 'User was successfully created.'
    else
      render action: 'new'
    end
  end
end
