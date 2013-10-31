class RequestsController < ApplicationController
  skip_before_filter :verify_authenticity_token  

  def index
    # Get all requests
    @requests = Request.all
  end

  def show
    # No view available (yet)
  end

  def new_step_1
    @request = Request.new
  end

  def new_step_2
    @request = Request.new(request_params)
    @request.date = Date.tomorrow
    if(@request.invalid?)
      render :new_step_1
    end
  end

  def new_overview
    @request = Request.new(request_params)
  end

  def create
    # Store new request into the database
    @request = Request.new(request_params)
    @request.user = User.first # Change to user session when login system is implemented

    if @request.save
      # Redirect to index function on success
      redirect_to :action => 'index', notice: 'User was successfully created.'
    else
      render action: 'new'
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def request_params
      params.require(:request).permit(:title, :date)
    end
end
