class RequestsController < ApplicationController
  def index
    # Get all requests
    @request = Request.all
  end

  def show
    redirect_to :action => 'index' # Redirect to index function
  end

  def new
    @request = Request.new
  end

  def create
    # Store new request into the database
    @request = Request.new
    @request.user = User.find_by_name("John Doe") # Placeholder
    @request.title = params[:title]
    @request.date = params[:date]

    respond_to do |format|
      if @request.save
        format.html { redirect_to @request, notice: 'User was successfully created.' }
        format.json { render action: 'index', status: :created, location: @request }
      else
        format.html { render action: 'new' }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end
end
